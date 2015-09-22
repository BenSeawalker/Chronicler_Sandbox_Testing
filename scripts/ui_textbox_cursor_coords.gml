///ui_textbox_cursor_coords( lines, cursor_pos )

var _lines     = argument0,
    _cursorPos = argument1;
    

var _cursor;
    _cursor[LINE] = 0;
    _cursor[ROW] = 0;
    
_cursor[ROW] = _cursorPos - 1;

var line_len = 0;
for(var i = 0; i < ds_list_size(_lines); ++i)
{
    line_len = string_length(string_list_get( _lines, _cursor[LINE], "text" ));
    line_len += !string_list_get( _lines, _cursor[LINE], "wrapped" )
    
    if(_cursor[ROW] < line_len)
        break;
        
    _cursor[ROW] -= line_len;
    _cursor[LINE] += 1;
}

if(_cursor[ROW] == line_len - 1)
{
    _cursor[ROW] -= line_len;
    _cursor[LINE] += 1;
}

return _cursor;
