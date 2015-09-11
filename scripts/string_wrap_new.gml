/// string_wrap( string, width, split )
//
//  Returns a given string, word wrapped to a pixel width,
//  with line break characters inserted between words.
//  Uses the currently defined font to determine text width.
//
//      string      text to word wrap, string
//      width       maximum pixel width before a line break, real
//      split       split words that are longer than the maximum, bool
//

var _textCurrent = string(argument[0]),
    _width       = real  (argument[1]),
    _split       = real  (argument[2]),
    //_pos         = string_length_full(_textCurrent);
    //if(argument_count > 3)
    //    _pos = argument[3];


var pos_space   = -1,
    pos_current =  1,
    //pos_total   =  1,
    //added_lines =  0,
    text_output = "";
    
while ( pos_current <= string_length( _textCurrent ) )
{
    //if the string already contains a line break...
    if(string_char_at( _textCurrent, pos_current ) == chr(10))
    {
        text_output += string_copy( _textCurrent, 1, pos_current );
        
        //remove the text we just looked at from the current text string
        _textCurrent = string_copy( _textCurrent,(pos_current + 1), string_length( _textCurrent ) );
        pos_current = 1;
        pos_space = -1;
    }
    
    if ( string_width( string_copy( _textCurrent, 1, pos_current ) ) >= _width )
    {
        //if there is a space in this line then we can break there
        if (pos_space != -1)
        {
           //if(pos_total < _pos + added_lines)
           //     added_lines++; 
            
            text_output += string_copy( _textCurrent, 1, pos_space ) + chr(10);
            
            //remove the text we just looked at from the current text string
            _textCurrent = string_copy( _textCurrent,(pos_space + 1), (string_length( _textCurrent ) - pos_space) );
            pos_current = 1;
            pos_space = -1;
        }
        else if (_split)
        {
            //if(pos_total < _pos + added_lines)
            //    added_lines++;     
        
            //if not, and we can force line breaks
            text_output += string_copy( _textCurrent, 1, (pos_current - 1) ) + chr(10);
            
            //remove the text we just looked at from the current text string
            _textCurrent = string_copy( _textCurrent, pos_current, (string_length( _textCurrent ) - (pos_current-1)) );
            pos_current = 1;
            pos_space = -1;
        }
    }
    
    var c = string_char_at( _textCurrent, pos_current );
    if ( c == ' ' || c == '-' || c == chr(9))
        pos_space = pos_current;
        
    pos_current += 1;
    //pos_total   += 1;
}

if ( string_length( _textCurrent ) > 0 )
    text_output += _textCurrent;
    

//var data = ds_map_create();
//ds_map_add( data, "text", text_output );
//ds_map_add( data, "lines", added_lines );

return text_output;
