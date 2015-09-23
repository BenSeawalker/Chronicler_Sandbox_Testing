//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3  f_ColorToMatch;
uniform float f_Vary;

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

uniform vec3  f_ColorToMatch;
uniform float f_Vary;

void main()
{
    vec4 Color = texture2D(gm_BaseTexture, v_vTexcoord);
    
    float RDiff = abs(Color.r - f_ColorToMatch.r),
          GDiff = abs(Color.g - f_ColorToMatch.g),
          BDiff = abs(Color.b - f_ColorToMatch.b);
          
    float Result = float((RDiff <= f_Vary) && (GDiff <= f_Vary) && (BDiff <= f_Vary));
    
    vec3 c  = (Color.rgb * Result),                                                 // color
         bw = vec3(dot( Color.rgb, vec3( 0.299, 0.587, 0.114 ) ) * (1.0 - Result)); // black and white
    
    gl_FragColor = v_vColour * vec4( mix( Color.rgb, (c + bw), 1.0 ), Color.a );
}


