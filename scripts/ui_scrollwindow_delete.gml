///ui_scrollwindow_delete( scroll_window, delete_subwindows )

var _scrollWindow     = argument0,
    _deleteSubWindows = argument1;
    

with(_scrollWindow)
{
    if(_deleteSubWindows)
    {
        for(var i = 0; i < ds_list_size(items); ++i)
        {
            with(items[|i])
                instance_destroy();
        }
    }
    
    instance_destroy();
}
