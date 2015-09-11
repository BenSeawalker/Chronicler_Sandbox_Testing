///string_list_lines( stringlist, line, wrapped )

var _strlst  = argument0,
    _line    = argument1,
    _wrapped = argument2;

    
var lines = 0;
for(var i = 0; i < _line; ++i)
{
    if(_wrapped)
        lines += string_list_get( _strlst, i, "wrapped");
    else
        lines += !string_list_get( _strlst, i, "wrapped");
}

return lines;
