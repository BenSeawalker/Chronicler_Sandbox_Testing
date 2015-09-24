///keyboard_check_chars( pressed )
/*
    checks for any key that prints a visible char to the screen
    this includes spaces, new lines, and tabs
*/

var _pressed = argument0;

for(var c = 32; c <= 126; ++c)
{
    if(_pressed)
    {
        if(keyboard_check_pressed(vk_anykey) && keyboard_check_direct(c))
            return true;
    }
    else
    {
        if(keyboard_check_direct(c))
            return true;
    }
}


// check for enter and tab:
    if(_pressed)
    {
        if(keyboard_check_pressed(vk_anykey) && (keyboard_check_direct(10) || keyboard_check_direct(11)))
            return true;
    }
    else
    {
        if(keyboard_check_direct(10) || keyboard_check_direct(11))
            return true;
    }
return false;
