//
//  CCShaderTypes.h
//  001--MetalBasicBuffers
//
//  Created by CC老师 on 2018/8/13.
//  Copyright © 2018年 CC老师. All rights reserved.
//
/*
 介绍:
 头文件包含了 Metal shaders 与C/OBJC 源之间共享的类型和枚举常数
 */
#ifndef CCShaderTypes_h
#define CCShaderTypes_h
#include <simd/simd.h>

// 缓存区索引值 共享与 shader 和 C 代码 为了确保Metal Shader缓存区索引能够匹配 Metal API Buffer 设置的集合调用
typedef enum CCVertexInputIndex
{
    //顶点
    CCVertexInputIndexVertices     = 0,
    //视图大小
    CCVertexInputIndexViewportSize = 1,
} CCVertexInputIndex;

//纹理索引
typedef enum CCTextureIndex
{
    CCTextureIndexBaseColor = 0
}CCTextureIndex;

//结构体: 顶点/纹理 坐标
typedef struct
{
    // 像素空间的位置
    // 像素中心点(100,100)
    vector_float2 position;
    // 2D 纹理
    vector_float2 textureCoordinate;
} CCVertex;


#endif /* CCShaderTypes_h */
