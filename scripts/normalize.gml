///normalize(val, min, max)

var _val = argument0,
    _min = argument1,
    _max = argument2;

return (((_val - _min) / ( _max - _min) - 0.5) * 2);
