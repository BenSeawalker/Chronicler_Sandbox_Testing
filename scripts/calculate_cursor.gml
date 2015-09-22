///calculate_cursor(TextBox)

var _tbox = argument0;


var lines = string_tokenize( _tbox.display_text, chr(10), false );
var num_lines = (ds_list_size(lines));

if(num_lines > 0)
{
    // line too long
    if(_tbox.cursor[LINE] > num_lines)
    {
        _tbox.cursor[LINE] = clamp( _tbox.cursor[LINE] - 1, 0, num_lines );
        _tbox.cursor[POS] = string_length(lines[|_tbox.cursor[LINE]]);
    }
    
    // cursor past the end of the line
    if((_tbox.cursor[LINE] < num_lines - 1) && (_tbox.cursor[POS] > string_length(lines[|_tbox.cursor[LINE]])))
    {
        _tbox.cursor[POS] -= string_length(lines[|_tbox.cursor[LINE]]);
        ++_tbox.cursor[LINE];
    }
    
    // cursor before the end of the line
    if((_tbox.cursor[LINE] > 0) && (_tbox.cursor[POS] < 0))
    {
        --_tbox.cursor[LINE];
        _tbox.cursor[POS] += string_length(lines[|_tbox.cursor[LINE]]);
    }
    
    // keep cursor in bounds
    _tbox.cursor[LINE] = clamp( _tbox.cursor[LINE], 0, (num_lines) );
    _tbox.cursor[POS]  = clamp( _tbox.cursor[POS], 0, string_length(lines[|_tbox.cursor[LINE]]) );
    
    
    // set the cursor location in the string
    _tbox.cursor[LOC] = _tbox.cursor[POS] + _tbox.added_lines;
    for(var i = 0; i < _tbox.cursor[LINE]; i++)
        _tbox.cursor[LOC] += string_length(lines[|i]);
        
    //_tbox.cursor[LOC] += string_count( chr(10), string_copy( _tbox.text, 1, _tbox.cursor[LOC] ) );// + num_lines + 1) );
}
else
{
    _tbox.cursor[LINE] = 0;
    _tbox.cursor[POS]  = 0;
    _tbox.cursor[LOC]  = 0;
}
