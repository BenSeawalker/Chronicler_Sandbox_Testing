//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 f_Saturation;
uniform vec3 f_ToColour;

//uniform float f_Offset;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 f_Saturation;
uniform vec3 f_ColorMin;
uniform vec3 f_ColorMax;

void main()
{
    vec4 Color = texture2D(gm_BaseTexture, v_vTexcoord);
    
    float Result = ((Color > f_ColorMin) && (Color < f_ColorMax));
    
    float bw1 = (vec3(1.0) * Result);                            // color
          bw2 = (dot(Color.rgb, f_Saturation) * (1.0 - Result)); // black and white
    
    gl_FragColor = vec4((bw1 + bw2) * f_ToColour , Color.a);
}

