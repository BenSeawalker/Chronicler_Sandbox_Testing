///ui_textbox_calculate_cursor_loc( x, y, TextBox )

var _x    = real(argument0),
    _y    = real(argument1),
    _tbox = real(argument2),


var xx = _tbox.x,
    yy = _tbox.y;
if(_tbox.window != noone)
{
    xx += _tbox.window.x;
    yy += _tbox.window.y;
}
    
var _cursorPos = 0;

// tokenize the lines
var lines = string_wrap_list( _tbox.text, _tbox.width, true );

var mx   = round( (_x - xx) ),                       // the horizontal position of the cursor in the box
    line = floor( ((_y - yy) / string_height("W")) ) // the exact line the cursor is on

// calculate the index of the char the cursor is on 
var cp = 0;

if(line < 0)
{
    line = 0;
    cp = 0;
}

// if the cursor is beyond the end of the line
if(line >= ds_list_size(lines) || mx > string_width(string_list_get( lines, line, "text" )))
{
    line = clamp( line, 0, (ds_list_size(lines) - 1) );         // clamp the line to the bounds of the list
    cp = string_length(string_list_get( lines, line, "text" )); // set the index to the end of the line
}
else
{
    // otherwise, keep checking characters until the width is the same as the cursor pos
    while(string_width( string_copy( string_list_get( lines, line, "text" ), 1, cp) ) < mx)
        cp++;
}

//cp -= string_list_get( lines, line, "wrapped" );
//cp -= !string_list_get( lines, line, "wrapped" );

/*
hello
world
and all who inhabit it
*/


//cp += !string_list_get( lines, line, "wrapped" );


if(line == (ds_list_size(lines) - 1))
    if(cp > string_length(string_list_get( lines, line, "text" )) / 2)
        cp += 1;

_cursorPos = ui_textbox_cursor_pos( lines, line, cp - 1);

// cleanup
string_list_destroy(lines);


return _cursorPos;
