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

var strlst = string_wrap_list( _textCurrent, _width, _split );

var txt = string_list_collapse( strlst, true );

string_list_destroy(strlst);

return txt;
