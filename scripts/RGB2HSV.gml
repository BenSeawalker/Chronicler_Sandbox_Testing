///RGB2HSV( _r, _g, _b )

var _r = argument0,
    _g = argument1,
    _b = argument2;
    

var hsv;
    hsv[0] = 0;
    hsv[1] = 0;
    hsv[2] = 0;
    

var K = 0;

if(_g < _b)
{
    var swap = _g;
        _g = _b;
        _b = swap;
        
    K = -1;
}

if(_r < _g)
{
    var swap = _r;
        _r = _g;
        _g = swap;
        
    K = ((-2 / 6) - K);
}

var chroma = _r - min( _g, _b );
hsv[h] = abs(K + ((_g - _b) / (6 * chroma + exp(-20))))
hsv[s] = (chroma / (_r + exp(-20)));
hsv[v] = _r;

return hsv;
