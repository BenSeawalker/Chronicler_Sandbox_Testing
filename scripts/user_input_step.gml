/// user_input_step(txt)

// add the latest text the user has typed to user_input
user_input += string_replace_all( keyboard_string, '#', '\#' ); // make hashtags visible
keyboard_string = ""; // reset for the next set of input

// Erase the last typed character with backspace.
// single backspace
if(keyboard_check_pressed(vk_backspace))
    global.ui_backspace_held = current_time;
    
if (keyboard_check(vk_backspace))
{
    // if backspace was just pressed, or held down for more than half a second
    if( (global.ui_backspace_held == current_time) ||  ((current_time - global.ui_backspace_held) >= 500) )
    {
        // if the last 2 characters were "\#"
        var hash = (string_copy( user_input, (string_length(user_input) - 1), 2 ) == "\#")
        user_input = string_copy( user_input, 1, string_length(user_input) - (1 + hash) );
    }
}

// add a newline with enter
if(keyboard_check_pressed(vk_enter))
    user_input += chr(10);

// add "tab" character
if(keyboard_check_pressed(vk_tab))
    user_input += "    ";//chr(9); // must use 4 ' ' for draw_text to work

//Paste with CTRL+V.
if (keyboard_check_pressed(vk_control) && keyboard_check(ord('V'))
    || keyboard_check(vk_control) && keyboard_check_pressed(ord('V'))) 
{
    user_input += string_replace_all(clipboard_get_text(),'#','\#'); // make hashtags visible
}
