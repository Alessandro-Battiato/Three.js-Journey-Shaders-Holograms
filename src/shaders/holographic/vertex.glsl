varying vec3 vPosition;

void main() {
    // Position
    vec4 modelPosition = modelMatrix * vec4(position, 1.0); 

    // Final position
    gl_Position = projectionMatrix * viewMatrix * modelPosition;

    // Varyings
    vPosition = modelPosition.xyz; // being vPosition a vec3, we extract only modelPosition's x y and z, this process is known as swizzling
}