///ui_create( x, y, width, height, objUI );

var _x      = argument0,
    _y      = argument1,
    _width  = argument2,
    _height = argument3,
    _item   = argument4;
    
    
var new_item = instance_create( _x, _y, _item );

with(new_item)
{
    width  = _width;
    height = _height;
    target_width = width;
    target_height = height;
}

return new_item;
