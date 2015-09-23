///color_normalize( color )

var _color = argument0;


var cNorm;
    cNorm[0] = (colour_get_red(_color)   / 255);
    cNorm[1] = (colour_get_green(_color) / 255);
    cNorm[2] = (colour_get_blue(_color)  / 255);
    
return cNorm;
