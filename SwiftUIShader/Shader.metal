//
//  Shader.metal
//  SwiftUIShader
//
//  Created by Den Jo on 4/30/24.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 gradientEffect(float2 position, float4 bounds, float seconds) {
    vector_float3 startColor = vector_float3(0.5, 0.39, 0.9);
    vector_float3 endColor = vector_float3(0.81, 0.51, 0.79);
    vector_float3 deltaColor = endColor - startColor;
    
    vector_float2 uv = position / bounds.zw;
    vector_float3 color = startColor + deltaColor * cos(seconds + uv.xyx);
    return half4(color.x, color.y, color.z, 1);
}
