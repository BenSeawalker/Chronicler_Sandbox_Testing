///ui_scrollwindow_add( scroll_window, item )

var _scrollWindow = argument0,
    _item         = argument1;


// shift the item's coordinates to local coords
_item.x -= _scrollWindow.x;
_item.y -= _scrollWindow.y;

_item.draw_disabled = true;
    
ds_list_add(_scrollWindow.items, _item);
