///update_user_input(cursor_pos, cursor_start, cursor_end)

var _cursorPos = string_length(user_input);
if(argument_count > 0)
    _cursorPos = min(argument[0], string_length(user_input));
    
var _cursorStart, _cursorEnd, after_cursor, text_mid;
if(argument_count > 2)
{
    _cursorStart = argument[1];
    _cursorEnd   = argument[2];

    if(_cursorEnd < _cursorStart)
    {
        var swap = _cursorStart;
        _cursorStart = _cursorEnd;
        _cursorEnd = swap;
    }
    
    text_mid = string_copy( user_input, _cursorStart+1, (_cursorEnd - _cursorStart) );
    
    //show_debug_message(string_insert( "|", string_insert( "|", user_input, _cursorStart + 1), _cursorEnd + 2 ));
    if(abs(_cursorStart - _cursorEnd) >= 1)
    {
        after_cursor = string_copy( user_input, (_cursorEnd + 1), string_length(user_input) );
        user_input = string_copy( user_input, 1, _cursorStart );
    }
    else
    {
        after_cursor = string_copy( user_input, (_cursorPos + 1), string_length(user_input) );
        user_input = string_copy(user_input, 1, _cursorPos);
    }
}
else
{
    // split user_input at _cursorPos
    after_cursor = string_copy( user_input, (_cursorPos + 1), string_length(user_input) );
    user_input = string_copy(user_input, 1, _cursorPos);
}

/////////////////////////////////////////////////////
//  UPDATE
////


global.keyboard_string_length = string_length(keyboard_string);

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

if(argument_count <= 1)
{
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
{
    var clipboard_text = string_replace_all(clipboard_get_text(),'#','\#');
    user_input += clipboard_text; // make hashtags visible
    
    global.keyboard_string_length += string_length_full(clipboard_text);
}


if(argument_count > 2)
{
    /////////////////////////////////////////////////////
    //  COPY
    ////
    //Copy with CTRL+C.
    if (keyboard_check_combo( vk_control, ord('C') ) )
    {
        clipboard_set_text(string_replace_all( text_mid, "\#", "#" ));
    }
}

if(argument_count > 2)
{
    if(keyboard_check_combo( vk_control, ord('C') ) || !keyboard_check_chars(true))
    {
        user_input += text_mid;
    }
    else
    {
        global.keyboard_string_length += (_cursorStart - _cursorPos);
    }
}

///////////////////////////////////////////////////
//  FINISH
////
user_input += after_cursor;

//keyboard_clear(keyboard_key);
