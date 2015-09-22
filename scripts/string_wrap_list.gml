/// string_wrap_list( string, width, split )
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
    _split       = real  (argument[2]);


var pos_space   = -1,
    pos_current =  1,
    is_wrapped  = false,
    text_output = ds_list_create();
    
while ( pos_current <= string_length( _textCurrent ) )
{
    //if the string already contains a line break...
    if(string_char_at( _textCurrent, pos_current ) == chr(10))
    {
        string_list_add_line( text_output, string_copy( _textCurrent, 1, (pos_current - 1) ), false );
        
        //remove the text we just looked at from the current text string
        _textCurrent = string_copy( _textCurrent,(pos_current + 1), (string_length(_textCurrent )) );
        //show_debug_message(string_replace_all(_textCurrent,chr(10),"*"));
        pos_current = 1;
        pos_space = -1;
        is_wrapped = false;
    }
    
    if ( string_width( string_copy( _textCurrent, 1, pos_current ) ) >= _width )
    {
        //if there is a space in this line then we can break there
        if (pos_space != -1)
        {
            string_list_add_line( text_output, string_copy( _textCurrent, 1, pos_space ), true );
            
            //remove the text we just looked at from the current text string
            _textCurrent = string_copy( _textCurrent,(pos_space + 1), (string_length(_textCurrent ) - pos_space) );
            pos_current = 1;
            pos_space = -1;
            is_wrapped = true;
        }
        else if (_split)
        {
            //if not, and we can force line breaks
            string_list_add_line( text_output, string_copy( _textCurrent, 1, pos_current ), true );
            
            //remove the text we just looked at from the current text string
            _textCurrent = string_copy( _textCurrent, pos_current, (string_length( _textCurrent ) - (pos_current-1)) );
            pos_current = 1;
            pos_space = -1;
            is_wrapped = true;
        }
    }
    
    var c = string_char_at( _textCurrent, pos_current );
    if ( c == ' ' || c == '-' || c == chr(9))
        pos_space = pos_current;
        
    pos_current += 1;
}

string_list_add_line( text_output, _textCurrent, false );
    
return text_output;
