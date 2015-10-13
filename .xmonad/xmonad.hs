--
-- David Beckingsale's xmonad config
-- 
-- Started out as avandael's xmonad.hs 
-- Also uses stuff from pbrisbin.com:8080/
--
 
--{{{ Imports 
import Data.List
 
import Graphics.X11.ExtraTypes.XF86
import Graphics.X11.Xlib
import Graphics.X11.Xlib.Types

import System.IO
import System.Environment as Env
 
import XMonad
 
import XMonad.Actions.GridSelect
import XMonad.Actions.TopicSpace
 
import XMonad.Core
 
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook
 
import XMonad.Layout
import XMonad.Layout.Grid
import XMonad.Layout.IM
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.ResizableTile
import XMonad.Layout.StackTile
 
import XMonad.Prompt
import XMonad.Prompt.Man
import XMonad.Prompt.Shell
import XMonad.Prompt.Workspace
 
import XMonad.StackSet as W
 
import XMonad.Util.EZConfig
import XMonad.Util.Run
 
import qualified Data.Map as M
--}}}
 
--{{{ Helper Functions
stripIM s = if ("IM " `isPrefixOf` s) then drop (length "IM ") s else s
 
wrapIcon home icon = "^p(5)^i(" ++ home ++ "/.dzen/" ++ icon ++ ")^p(5)"
--}}}

main = do
   checkTopicConfig myTopics myTopicConfig
   myStatusBarPipe <- spawnPipe myStatusBar
   home <- Env.getEnv "HOME"
   xmonad $ myUrgencyHook $ defaultConfig
      { terminal = "urxvt"
      , normalBorderColor  = myInactiveBorderColor
      , focusedBorderColor = myActiveBorderColor
      , borderWidth = myBorderWidth
      , manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
      , layoutHook = smartBorders $ avoidStruts $ myLayoutHook
      , logHook = dynamicLogWithPP $ myDzenPP myStatusBarPipe home
      , modMask = mod4Mask
      , keys = myKeys home
      , XMonad.Core.workspaces = myTopics
      , startupHook = do setWMName "LG3D"
                         screens  <- withDisplay getCleanedScreenInfo
                         conkyBar <- spawnPipe $ myConkyBar $ rect_width $ head screens
                         goto "3:sh"
     }   
 
--{{{ Theme 
 
--Font
myFont = "Inconsolata-11"
 
-- Colors
 
--- Main Colours
myFgColor = "#DCDCCC"
myBgColor = "#3f3f3f"
myHighlightedFgColor = myFgColor
myHighlightedBgColor = "#7F9F7F"
 
--- Borders
myActiveBorderColor = myCurrentWsBgColor
myInactiveBorderColor = "#262626"
myBorderWidth = 2
 
--- Ws Stuff
myCurrentWsFgColor = myHighlightedFgColor
myCurrentWsBgColor = myHighlightedBgColor
myVisibleWsFgColor = myBgColor
myVisibleWsBgColor = "#CCDC90"
myHiddenWsFgColor = myHighlightedFgColor
myHiddenEmptyWsFgColor = "#8F8F8F"
myUrgentWsBgColor = "#DCA3A3"
myTitleFgColor = myFgColor
 
 
--- Urgency
myUrgencyHintFgColor = "red"
myUrgencyHintBgColor = "blue"
 
-- }}}
 
-- dzen general options
myDzenGenOpts = "-fg '" ++ myFgColor ++ "' -bg '" ++ myBgColor ++ "' -h '15'" ++ " -e 'onstart=lower' -fn '" ++ myFont ++ "'"
 
-- Status Bar
myStatusBar = "dzen2 -w 800 -ta l " ++ myDzenGenOpts
 
-- Conky Bar
myConkyBar screen_width = "conky -c ~/.conky_bar | dzen2 -x 800 -w "++ show (screen_width - 800) ++" -ta l " ++ myDzenGenOpts

-- Layouts
myLayoutHook = avoidStruts $ onWorkspace "3:sh" imLayout $ standardLayouts
               where standardLayouts = tiled ||| Mirror tiled ||| Full
                     imLayout = withIM (2/10) (Role "buddy_list") (standardLayouts)
                     tiled = ResizableTall nmaster delta ratio []
                     nmaster = 1 
                     delta = 0.03
                     ratio = 0.5
-- Workspaces
myWorkspaces =
   [
      "1:im",
      "2:ed",
      "3:sh",
      "4:web",
      "5:log",
      "6:mus",
      "7:misc"
   ]

myTopics :: [Topic]
myTopics =
  [
      "1:im",
      "2:ed",
      "3:sh",
      "4:web",
      "5:log",
      "6:mus",
      "7:misc"
  ]

myTopicConfig :: TopicConfig
myTopicConfig = defaultTopicConfig
  { topicDirs = M.fromList $
      [ ("1:im", "~")
      , ("2:ed", "git")
      , ("3:sh", "~")
      , ("4:web", "Downloads")
      , ("5:log", "/var/log")
      , ("6:mus", "music")
      , ("7:misc", "~")
      ]
  , defaultTopicAction = const $ spawnShell
  , defaultTopic = "3:sh"
  , topicActions = M.fromList $
      [ ("1:im",       spawn "urxvt -e weechat")
      , ("2:ed",       spawn "emacs")
      , ("3:sh",       spawnShell)
      , ("4:web",      spawn "firefox")
      , ("5:log",      spawnShell)
      , ("6:mus",      spawnShell)
      , ("7:misc",     spawnShell)
      ]
  }

spawnShell :: X ()
spawnShell = currentTopicDir myTopicConfig >>= spawnShellIn

spawnShellIn :: Dir -> X ()
spawnShellIn dir = spawn $ "urxvt -cd " ++ dir

goto :: Topic -> X ()
goto = switchTopic myTopicConfig

promptedGoto :: X ()
promptedGoto = workspacePrompt myXPConfig goto

promptedShift :: X ()
promptedShift = workspacePrompt myXPConfig $ windows . W.shift

myXPConfig :: XPConfig
myXPConfig = defaultXPConfig
-- myXPConfig = defaultXPConfig {font="-*-lucida-medium-r-*-*-14-*-*-*-*-*-*-*"
--                              ,height=22}
             
-- Urgency hint configuration
myUrgencyHook = withUrgencyHook dzenUrgencyHook
    {
      args = [
         "-x", "0", "-y", "576", "-h", "15", "-w", "1024",
         "-ta", "r",
         "-fg", "" ++ myUrgencyHintFgColor ++ "",
         "-bg", "" ++ myUrgencyHintBgColor ++ ""
         ]
    }
 
--{{{ Hook for managing windows
myManageHook = composeAll
   [ resource  =? "Do"               --> doIgnore,              -- Ignore GnomeDo
--     className =? "Pidgin"           --> doShift " 4 im ",      -- Shift Pidgin to im desktop 
--     className =? "Chrome"           --> doShift " 3 www ",     -- Shift Chromium to www
--     className =? "Firefox"          --> doShift " 3 www ",     -- Shift Firefox to www
--     className =? "Emacs"            --> doShift " 2 ed ",      -- Shift emacs to emacs
--     className =? "Wicd-client.py"   --> doFloat,                -- Float Wicd window 
     isFullscreen 		     --> (doF W.focusDown <+> doFullFloat)
   ]
--}}}
 
-- Union default and new key bindings
myKeys home x  = M.union (M.fromList (newKeys home x)) (keys defaultConfig x)
 
--{{{ Keybindings 
--    Add new and/or redefine key bindings
newKeys home conf@(XConfig {XMonad.modMask = modm}) = [
  ((modm, xK_p), spawn "dmenu_run -nb '#3F3F3F' -nf '#DCDCCC' -sb '#7F9F7F' -sf '#DCDCCC'"),  --Uses a colourscheme with dmenu
  ((0, xK_Print), spawn "scrot"),
  ((modm, xK_z), goToSelected myGSConfig),
  ((0, xF86XK_AudioMute), spawn "amixer -c 0 -q set PCM toggle"),
  ((0, xF86XK_AudioRaiseVolume), spawn "amixer -c 0 -q set PCM 2+"),
  ((0, xF86XK_AudioLowerVolume), spawn "amixer -c 0 -q set PCM 2-"),
  ((modm, xK_y), sendMessage ToggleStruts),
  ((modm, xK_u), sendMessage MirrorShrink),
  ((modm, xK_i), sendMessage MirrorExpand)
  , ((modm              , xK_a     ), currentTopicAction myTopicConfig)
  , ((modm              , xK_g     ), promptedGoto)
  , ((modm .|. shiftMask, xK_g     ), promptedShift)
  , ((modm,               xK_q     ), spawn "killall conky dzen2 && xmonad --recompile && xmonad --restart")  
  ]
  ++
  [ ((modm, k), goto i)
  | (i, k) <- zip [ "1:im"
                  , "2:ed"
                  , "3:sh"
                  , "4:web"
                  , "5:log"
                  , "6:mus"
                  , "7:misc" ] workspaceKeys]
 where workspaceKeys = [xK_1 .. xK_7]
--}}}
 
---{{{ Dzen Config
myDzenPP h home = defaultPP {
  ppOutput = hPutStrLn h,
  ppSep = (wrapFg myHighlightedBgColor "|"),
  ppWsSep = " ",
  ppCurrent = wrapFgBg myCurrentWsFgColor myCurrentWsBgColor,
  ppVisible = wrapFgBg myVisibleWsFgColor myVisibleWsBgColor,
  ppHidden = wrapFg myHiddenWsFgColor,
  ppHiddenNoWindows = wrapFg myHiddenEmptyWsFgColor,
  ppUrgent = wrapBg myUrgentWsBgColor,
  ppTitle = (\x -> "  " ++ wrapFg myTitleFgColor x),
  ppLayout  = dzenColor myFgColor"" .
                (\x -> case x of
                    "ResizableTall" -> wrapIcon home "layout_tall.xbm"
                    "Mirror ResizableTall" -> wrapIcon home "layout_mirror_tall.xbm"
                    "Full" -> wrapIcon home "layout_full.xbm"
                ) . stripIM
  }
  where
    wrapFgBg fgColor bgColor content= wrap ("^fg(" ++ fgColor ++ ")^bg(" ++ bgColor ++ ")") "^fg()^bg()" content
    wrapFg color content = wrap ("^fg(" ++ color ++ ")") "^fg()" content
    wrapBg color content = wrap ("^bg(" ++ color ++ ")") "^bg()" content
--}}}
 
--{{{ GridSelect
myGSConfig = defaultGSConfig
    { gs_cellheight = 50
    , gs_cellwidth = 250
    , gs_cellpadding = 10
    --, gs_colorizer = ""
    , gs_font = "" ++ myFont ++ ""
    --, gs_navigate = ""
    --, gs_originFractX = ""
    --, gs_originFractY = ""
    }
--}}}
