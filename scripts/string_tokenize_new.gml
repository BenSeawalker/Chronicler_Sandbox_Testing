/// string_tokenize( _str, _token, _ignore)
//
//  Returns a ds_list containing all substring elements within
//  a given string which are separated by a given _token.
//
//  eg. string_parse("cat|dog|house|bee", "|", true)
//      returns a ds_list { "cat", "dog", "house", "bee" }
//
//      str         elements, string
//      token       element separator,  string
//      ignore      ignore empty substrings, bool
//
/// GMLscripts.com/license

var _str    = argument0,
    _token  = argument1,
    _ignore = argument2;
    

var list = ds_list_create(),
    tlen = string_length(_token);

while ( string_length(_str) != 0 )
{
    //find the location of the next token
    var token_pos = string_pos( _token, _str );
    
    //if it exists
    if (token_pos > 0)
    {
        if (token_pos != 1 || !_ignore)
            ds_list_add( list, string_copy( _str, 1, (token_pos - 1) ) );
            
        _str = string_copy( _str, (token_pos + tlen), string_length(_str) );
    }
    else
    {
        ds_list_add( list, _str );
        _str = "";
    }
}


return list;
