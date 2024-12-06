uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
uniform float uTime;  // The time uniform
uniform vec2 uFrequency;  // The frequency for wind oscillation

attribute vec3 position;  // The position of the vertex
attribute vec2 uv;  // UV coordinates of the geometry

varying vec2 vUv;  // To pass the UV to the fragment shader
varying float vElevation;  // To pass the elevation to the fragment shader

void main()
{
    // Calculate the model position using the model matrix
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    // Apply wind elevation (sine wave oscillation) to the Z-coordinate
    float elevation = sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    elevation += sin(modelPosition.y * uFrequency.y - uTime) * 0.1;

    // Add the calculated elevation to the Z position
    modelPosition.z += elevation;

    // Pass the UV coordinates to the fragment shader
    vUv = uv;

    // Pass the elevation value to the fragment shader
    vElevation = elevation;

    // Transform the position using the view and projection matrices
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    // Set the final position of the vertex
    gl_Position = projectedPosition;
}
