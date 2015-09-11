///string_list_add_line( stringlist, text, wrapped )

var _strlst  = argument0,
    _text    = argument1,
    _wrapped = argument2;
    
    
var line = ds_map_create();
    ds_map_add( line, "text", _text );
    ds_map_add( line, "wrapped", _wrapped );
    
ds_list_add( _strlst, line );
