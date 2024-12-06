precision mediump float;

uniform sampler2D uTexture;  // The texture being applied
varying vec2 vUv;  // The UV coordinates from the vertex shader
varying float vElevation;  // The elevation passed from the vertex shader

void main()
{
    // Sample the texture using the UV coordinates
    vec4 textureColor = texture2D(uTexture, vUv);

    // Modify the texture color based on the elevation value
    textureColor.rgb *= vElevation * 2.0 + 0.5;

    // Set the final fragment color
    gl_FragColor = textureColor;
}
