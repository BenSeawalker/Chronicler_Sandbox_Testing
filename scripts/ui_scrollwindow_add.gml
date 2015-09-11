///ui_scrollwindow_add( scroll_window, item, off_x, off_y )

var _scrollWindow = argument0,
    _item         = argument1,
    _offX         = argument2,
    _offY         = argument3;

// shift the item's coordinates to local coords
_item.x = _offX;//-= _scrollWindow.x;
_item.y = _offY;//-= _scrollWindow.y;

_item.draw_disabled = true;
_item.window = _scrollWindow;
    
ds_list_add(_scrollWindow.items, _item);
