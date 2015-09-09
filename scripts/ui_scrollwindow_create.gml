///ui_scrollwindow_create( x, y, width, height );

var _x      = argument0,
    _y      = argument1,
    _width  = argument2,
    _height = argument3;
    
    
var scroll_window = instance_create( _x, _y, objUIScrollWindow );

with(scroll_window)
{
    width  = _width;
    height = _height;
}

return scroll_window;
