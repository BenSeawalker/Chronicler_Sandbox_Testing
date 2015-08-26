///string_collapse(ds_list, sep)

var _lst = argument0,
    _sep = argument1;

var str = "";

for(var i = 0; i < ds_list_size(_lst); i++)
    str += _lst[|i] + _sep;
    
return str;
