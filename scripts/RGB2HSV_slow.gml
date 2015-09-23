///RGB2HSV( _r, _g, _b )

var _r = argument0,
    _g = argument1,
    _b = argument2;
    

var hsv;
    hsv[h] = 0;
    hsv[s] = 0;
    hsv[v] = 0;
    

var rgb_max = max( _r, _g, _b ),
    rgb_min = min( _r, _g, _b ),
    delta   = rgb_max - rgb_min;

hsv[s] = (delta / (rgb_max + exp(-20)));
hsv[v] = rgb_max;

if(_r == rgb_max)
    hsv[h] = ((_g - _b) / (delta + exp(-20)));
else if(_g == rgb_max)
    hsv[h] = (2 + ((_b - _r) / (delta + exp(-20))));
else
    hsv[h] = (4 + ((_r - _g) / (delta + exp(-20))));
    
if(hsv[h] < 0)
    hsv[h] += 6;
    
hsv[h] *= (1 / 6);


return hsv;
