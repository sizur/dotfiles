
function conky_format( format, str )
    return string.format( format, conky_parse( str ) )
end
