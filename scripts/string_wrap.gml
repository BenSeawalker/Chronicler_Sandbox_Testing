/// string_wrap( string, width, split )
//
//  Returns a given string, word wrapped to a pixel width,
//  with line break characters inserted between words.
//  Uses the currently defined font to determine text width.
//
//      string      text to word wrap, string
//      width       maximum pixel width before a line break, real
//      break       line break characters to insert into text, string
//      split       split words that are longer than the maximum, bool
//

var _textCurrent = string (argument0),
    _width       = real   (argument1),
    _split       = real   (argument2);


var pos_space   = -1,
    pos_current =  1,
    text_output = "";
    
while ( pos_current <= string_length( _textCurrent ) )
{    
    if ( string_width( string_copy( _textCurrent, 1, pos_current ) ) >= _width )
    {
        //if there is a space in this line then we can break there
        if (pos_space != -1)
        {
            text_output += string_copy( _textCurrent, 1, pos_space ) + chr(10);
            
            //remove the text we just looked at from the current text string
            _textCurrent = string_copy( _textCurrent,(pos_space + 1), (string_length( _textCurrent ) - pos_space) );
            pos_current = 1;
            pos_space = -1;
        }
        else if (_split)
        {
            //if not, and we can force line breaks
            text_output += string_copy( _textCurrent, 1, (pos_current - 1) ) + chr(10);
            
            //remove the text we just looked at from the current text string
            _textCurrent = string_copy( _textCurrent, pos_current, (string_length( _textCurrent ) - (pos_current-1)) );
            pos_current = 1;
            pos_space = -1;
        }
    }
    
    var c = string_char_at( _textCurrent, pos_current );
    if ( c == ' ' || c == '-' || c == chr(9) )
        pos_space = pos_current;
        
    pos_current += 1;
}

if ( string_length( _textCurrent ) > 0 )
    text_output += _textCurrent;
    
    
return text_output;
