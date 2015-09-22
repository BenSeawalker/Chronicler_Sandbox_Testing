///ui_textbox_cursor_pos( stringlist, line, row )

var _strlst = argument0,
    _line   = argument1,
    _row    = argument2;
    

var cursorPos = _row;
    
for(var i = 0; i < _line; ++i)
{
    cursorPos += string_length(string_list_get( _strlst, i, "text" ));
    //cursorPos += string_list_get( _strlst, i, "wrapped" );
    cursorPos += !string_list_get( _strlst, i, "wrapped" );
}

return cursorPos;
