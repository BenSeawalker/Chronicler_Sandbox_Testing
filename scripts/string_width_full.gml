///string_width_full(str)

var _str = argument0;


var lines = string_tokenize(_str, chr(10), true);


var str_width = 0;
for(var i = 0; i < ds_list_size(lines); i++)
    str_width = max( str_width, string_width(lines[|i]) );


ds_list_destroy(lines);


return str_width;
