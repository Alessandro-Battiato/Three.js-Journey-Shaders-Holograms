varying vec3 vPosition;
varying vec3 vNormal;

// "Random" value
float random2D(vec2 value) {
    return fract(sin(dot(value.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

void main() {
    // Position
    vec4 modelPosition = modelMatrix * vec4(position, 1.0); 

    // Glitch effect
    modelPosition.x += random2D(modelPosition.xz);

    // Final position
    gl_Position = projectionMatrix * viewMatrix * modelPosition;

    // Model normal, since we want the vector to stay still and not move along with the model rotating, the following operation is needed
    vec4 modelNormal = modelMatrix * vec4(normal, 0.0); // when the fourth value (which here is 0.0, while the vec4 inside the modelPosition has 1.0 as the fourth value) is 1.0, it is "homogeneous" which means that all of the 3 transformations (translation, rotation, scale) will be applied, but when it's 0, translation won't be applied, this means that we need 0.0 to avoid making the normal move

    // Varyings
    vPosition = modelPosition.xyz; // being vPosition a vec3, we extract only modelPosition's x y and z, this process is known as swizzling
    vNormal = modelNormal.xyz;
}