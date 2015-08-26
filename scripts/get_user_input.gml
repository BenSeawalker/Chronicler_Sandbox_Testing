///user_input_update(cursor_pos)

var _cursorPos = string_length(user_input);
if(argument_count > 0)
    _cursorPos = min(argument[0], string_length(user_input));

/////////////////////////////////////////////////////
//  UPDATE
////

// split user_input at _cursorPos
var after_cursor = string_copy( user_input, (_cursorPos + 1), string_length(user_input) );
user_input = string_copy(user_input, 1, _cursorPos);

// add the latest text the user has typed to user_input
user_input += string_replace_all( keyboard_string, '#', '\#' ); // make hashtags visible
keyboard_string = ""; // reset for the next set of input


/////////////////////////////////////////////////////
//  BACKSPACE
////
// Erase the last typed character(s) with backspace.
// single backspace
if( keyboard_check_pressed(vk_backspace) ||  keyboard_check_pressed(vk_delete) )
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
else if(string_length(after_cursor) > 0 && keyboard_check(vk_delete))
{
    // if delete was just pressed, or held down for more than half a second
    if( (global.ui_backspace_held == current_time) ||  ((current_time - global.ui_backspace_held) >= 500) )
    {
        // if the next 2 characters are "\#"
        var hash = (string_copy( after_cursor, 1, 2 ) == "\#")
        after_cursor = string_copy( after_cursor, 2+hash, string_length(after_cursor));
    }
}



/////////////////////////////////////////////////////
//  ENTER
////
// Add a newline with enter
if( keyboard_check_pressed(vk_enter) )
    user_input += chr(10);

    
/////////////////////////////////////////////////////
//  TAB
////
// Add "tab" character
if( keyboard_check_pressed(vk_tab) )
    user_input += "    ";//chr(9); // must use 4 spaces for draw_text to work

    
/////////////////////////////////////////////////////
//  PASTE
////
//Paste with CTRL+V.
if (keyboard_check_combo( vk_control, ord('V') ) )
    user_input += string_replace_all(clipboard_get_text(),'#','\#'); // make hashtags visible
    
    

///////////////////////////////////////////////////
//  FINISH
////
user_input += after_cursor;
