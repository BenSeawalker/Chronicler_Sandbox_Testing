///string_list_destroy(stringlist)

var _strlst = argument0;

for(var i = 0; i < ds_list_size(_strlst); i++)
{
    ds_map_destroy(_strlst[|i]);
}

ds_list_destroy(_strlst);
