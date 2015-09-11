///string_list_collapse( stringlist, wrapped )

var _strlst  = argument0,
    _wrapped = argument1;

var txt = "";
for(var i = 0; i < ds_list_size(_strlst); ++i)
{
    txt += string_list_get( _strlst, i, "text" );
    
    if( i < ds_list_size(_strlst) - 1)
    {
       if(_wrapped && string_list_get( _strlst, i, "wrapped" ))
            txt += chr(10);
    }
}

return txt;
