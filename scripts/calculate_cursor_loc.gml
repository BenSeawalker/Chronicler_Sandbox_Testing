///calculate_cursor_loc( x, y, TextBox )

var _x    = real(argument0),
    _y    = real(argument1),
    _tbox = real(argument2),

    
var _cursorPos = 0;

// tokenize the lines
var lines = string_tokenize( _tbox.text, chr(10), false );

var mx   = floor( (_x - _tbox.x) ),                       // the horizontal position of the cursor in the box
    line = floor( ((_y - _tbox.y) / string_height("W")) ) // the exact line the cursor is on

// calculate the index of the char the cursor is on 
var cp = 0;

// if the cursor is beyond the end of the line
if(line >= ds_list_size(lines) || mx > string_width(lines[|line]))
{
    line = clamp( line, 0, (ds_list_size(lines) - 1) ); // clamp the line to the bounds of the list
    cp = string_length(lines[|line]);                   // set the index to the end of the line
}
else
{
    // otherwise, keep checking characters until the width is the same as the cursor pos
    while(string_width( string_copy( lines[|line], 1, cp) ) < mx)
        cp++;
}

//_tbox.cursor[LINE] = line;
//_tbox.cursor[POS]  = cp;

//calculate_cursor(_tbox)

///*
_cursorPos = cp;              // move the cursor to the correct position in the line
for(var i = 0; i < line; i++) // shift the cursor down until it's on the correct line
    _cursorPos += string_length(lines[|i]); 

// account for user typed newline chars
//_cursorPos += string_count( chr(10), string_copy( _tbox.text, 1, _cursorPos ) );


// clamp the cursor to the bounds of the displayed text
_cursorPos = clamp( _cursorPos, 0, string_length_full(_tbox.text) );
//*/

// cleanup
ds_list_destroy(lines);


return _cursorPos;
