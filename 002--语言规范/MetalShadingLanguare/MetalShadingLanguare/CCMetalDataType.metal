//
//  CCMetalDataType.metal
//  MetalShadingLanguare
//
//  Created by CC老师 on 2018/7/28.
//  Copyright © 2018年 CC老师. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

//基本数据类型
bool a = true;
char b = 5;
int  d = 15;
size_t c = 1;
ptrdiff_t f = 2;

//向量
bool2 A= {1,2};
float4 pos = float4(1.0,2.0,3.0,4.0);
float x = pos[0];
float y = pos[1];

float4 VB;
for(int i = 0; i < 4 ; i++)
    VB[i] = pos[i] * 2.0f;


//通过向量字母来获取元素
int4 test = int4(0,1,2,3);
int a = test.x;
int b = test.y;
int c = test.z;
int d = test.w;

int e = test.r;
int f = test.g;
int g = test.b;
int h = test.a;

float4 c;
c.xyzw = float4(1.0f,2.0f,3.0f,4.0f);
c.z = 1.0f;
c.xy = float2(3.0f,4.0f);
c.xyz = float3(3.0f,4.0f,5.0f);


float4 pos = float4(1.0f,2.0f,3.0f,4.0f);
float4 swiz = pos.wxyz;  //swiz = (4.0,1.0,2.0,3.0);
float4 dup = pos.xxyy;  //dup = (1.0f,1.0f,2.0f,2.0f);

//pos = (5.0f,2.0,3.0,6.0)
pos.xw = float2(5.0f,6.0f);

//pos = (8.0f,2.0f,3.0f,7.0f)
pos.wx = float2(7.0f,8.0f);

//pos = (3.0f,5.0f,9.0f,7.0f);
pos.xyz = float3(3.0f,5.0f,9.0f);



float2 pos;
pos.x = 1.0f; //合法
pos.z = 1.0f; //非法

float3 pos2;
pos2.z = 1.0f; //合法
pos2.w = 1.0f; //非法

//非法,x出现2次
pos.xx = float2(3.0,4.0f);
//不合法-使用混合限定符
pos.xy = float4(1.0f,2.0,3.0,4.0);

float4 pos4 = float4(1.0f,2.0f,3.0f,4.0f);
pos4.x = 1.0f;
pos4.y = 2.0f;
//非法,.rgba与.xyzw 混合使用
pos4.xg = float2(2.0f,3.0f);
////非法,.rgba与.xyzw 混合使用
float3 coord = pos4.ryz;

float4 pos5 = float4(1.0f,2.0f,3.0f,4.0f);
//非法,使用指针来指向向量/分量
my_func(&pos5.xy);

float4x4 m;
//将第二排的值设置为0
m[1] = float4(2.0f);

//设置第一行/第一列为1.0f
m[0][0] = 1.0f;

//设置第三行第四列的元素为3.0f
m[2][3] = 3.0f;

//float4类型向量的所有可能构造方式
float4(float x);
float4(float x,float y,float z,float w);
float4(float2 a,float2 b);
float4(float2 a,float b,float c);
float4(float a,float2 b,float c);
float4(float a,float b,float2 c);
float4(float3 a,float b);
float4(float a,float3 b);
float4(float4 x);

//float3类型向量的所有可能的构造的方式
float3(float x);
float3(float x,float y,float z);
float3(float a,float2 b);
float3(float2 a,float b);
float3(float3 x);

//float2类型向量的所有可能的构造方式
float2(float x);
float2(float x,float y);
float2(float2 x);

//多个向量构造器的使用
float x = 1.0f,y = 2.0f,z = 3.0f,w = 4.0f;
float4 a = float4(0.0f);
float4 b = float4(x,y,z,w);
float2 c = float2(5.0f,6.0f);
float2 a = float2(x,y);
float2 b = float2(z,w);
float4 x = float4(a.xy,b.xy);


//缓存buffer
device float4 *device_buffer;
struct my_user_data{
    float4 a;
    float b;
    int2 c;
};
constant my_user_data *user_data;


//纹理texture
enum class access {sample,read,write};
texture1d<T,access a = access::sample>
texture1d_array<T,access a = access::sample>
texture2d<T,access a = access::sample>
texture2d_array<T,access a = access::sample>
texture3d<T,access a = access::sample>
texturecube<T,access a = access::sample>
texture2d_ms<T,access a = access::read>

//带有深度格式的纹理必须被声明为下面纹理数据类型中的一个
enum class depth_forma {depth_float};
depth2d<T,access a = depth_format::depth_float>
depth2d_array<T,access a = access::sample,depth_format d = depth_format::depth_float>
depthcube<T,access a = access::sample,depth_format d = depth_format::depth_float>
depth2d_ms<T,access a = access::read,depth_format d = depth_format::depth_float>


void foo (texture2d<float> imgA[[texture(0)]],
          texture2d<float,access::read> imgB[[texture(1)]],
          texture2d<float,access::write> imgC[[texture(2)]])
{
    
    //...
}





