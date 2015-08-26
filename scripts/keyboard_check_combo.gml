///keyboard_check_combo( key1, key2, ...key3 )

var _key1 = argument[0],
    _key2 = argument[1],
    _key3 = -1;

if(argument_count > 2)
    _key3 = argument[2];
    

var key_combo = false;
    
switch(argument_count)
{
    case 2:
        key_combo = ( (keyboard_check_pressed(_key1) && keyboard_check(_key2)) ||
                      (keyboard_check(_key1) && keyboard_check_pressed(_key2))
                    );
    break;
    
    case 3:
        key_combo = ( (keyboard_check_pressed(_key1) && keyboard_check(_key2) && keyboard_check(_key3)) ||
                      (keyboard_check(_key1) && keyboard_check_pressed(_key2) && keyboard_check(_key3)) ||
                      (keyboard_check(_key1) && keyboard_check(_key2) && keyboard_check_pressed(_key3))
                    );
    break;
}


return key_combo 
