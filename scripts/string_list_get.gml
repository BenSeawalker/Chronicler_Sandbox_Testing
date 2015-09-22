///string_list_get( stringlist, line, key )

var _strlst = argument0,
    _line   = argument1,
    _key    = argument2;
    
if(!ds_exists(_strlst, ds_type_list) || (_line < 0) || (_line >= ds_list_size(_strlst)))
    return "";
    
return ds_map_find_value( _strlst[|_line], _key );
