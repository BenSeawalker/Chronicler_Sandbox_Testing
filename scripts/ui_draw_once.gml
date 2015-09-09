///ui_draw_once(objUI)

var _item = argument0;


with(_item)
{
    var draw_disabled_prev = draw_disabled;
    draw_disabled = false;
    
    event_perform( ev_draw, 0 );
    
    draw_disabled = draw_disabled_prev;
}
