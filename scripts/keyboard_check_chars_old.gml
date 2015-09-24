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
        if(keyboard_check_pressed(c))
            return true;
    }
    else
    {
        if(keyboard_check(c))
            return true;
    }
}


// check for enter and tab:
    if(_pressed)
    {
        if(keyboard_check_pressed(10) || keyboard_check_pressed(11))
            return true;
    }
    else
    {
        if(keyboard_check(10) || keyboard_check(11))
            return true;
    }
return false;
