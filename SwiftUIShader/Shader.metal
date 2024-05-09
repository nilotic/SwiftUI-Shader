//
//  Shader.metal
//  SwiftUIShader
//
//  Created by Den Jo on 4/30/24.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 gradientEffect(float2 position, float4 bounds, float time) {
    vector_float3 startColor = vector_float3(0.49, 0.39, 0.9);
    vector_float3 endColor = vector_float3(0.81, 0.51, 0.78);
    vector_float3 deltaColor = endColor - startColor;
    
    vector_float2 uv = position / bounds.zw;
    
    // Gradient Anmation (https://www.desmos.com/calculator/aodblxw1zg)
    vector_float3 color = startColor + deltaColor * (1 + cos(time + uv.xyx)) / 2;
    return half4(color.x, color.y, color.z, 1);
}

[[ stitchable ]] half4 gradientEffect2(float2 position, float4 bounds, float time) {
    vector_float3 startColor = vector_float3(0.5, 0.39, 0.9);
    vector_float3 endColor = vector_float3(0.81, 0.51, 0.79);
    vector_float3 deltaColor = endColor - startColor;
    vector_float2 uv = position / bounds.wz;
    
    // Gradient Color
    vector_float3 color = startColor + deltaColor * sin(uv.xyx);
    
    // Lens Flare effect (https://www.desmos.com/calculator/lphnjm3g27)
    float x = fmod(cos(2 * time - uv.x) + 2, 2) - 1;
    float offset = 1 - pow(cos(x - atan(x)), 30);
    color = color + vector_float3(offset, offset, offset);
    
    return half4(color.x, color.y, color.z, 1);
}

[[ stitchable ]] half4 gradientEffect3(float2 position, float4 bounds, float time) {
    vector_float3 startColor = vector_float3(0.74, 0.46, 1);
    vector_float3 middleColor = vector_float3(0.31, 0.58, 0.86);
    vector_float3 endColor = vector_float3(0.6, 0.80, 0.93);
    
    vector_float2 uv = position / bounds.zw;
    float3 color = startColor;

    // Gradient  Animation (https://www.desmos.com/calculator/pl585ejqgh)
    float ratio = (1 + cos((time - uv.x) * M_PI_F)) / 2;
    color = mix(startColor, middleColor, smoothstep(0, 0.25, ratio));
    color = mix(color, endColor, smoothstep(0.25, 0.5, ratio));
    color = mix(color, middleColor, smoothstep(0.5, 0.75, ratio));
    color = mix(color, startColor, smoothstep(0.75, 1, ratio));
    
    return half4(color.x, color.y, color.z, 1);
}
