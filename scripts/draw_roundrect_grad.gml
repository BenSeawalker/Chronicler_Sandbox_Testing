///draw_roundrect_grad( x1, y1, x2, y2, colour1, colour2, border, smootheness )

var x1 = argument0,
    y1 = argument1,
    x2 = argument2,
    y2 = argument3,
    c1 = argument4,
    c2 = argument5,
    br = argument6,
    sm = argument7;
    
//draw_set_alpha(1);
//draw_roundrect_colour( x1, y1, x2, y2,c1, c1, false );
    
var i = 0;
for(i = 0; i <= br; ++i)
{
    draw_set_alpha( i / power(br,sm));
    draw_roundrect_colour( (x1 + i), (y1 + i), (x2 - i), (y2 - i),c2, c2, false );
}

draw_set_alpha(1);
draw_roundrect_colour( (x1 + i), (y1 + i), (x2 - i), (y2 - i),c1, c1, false );
