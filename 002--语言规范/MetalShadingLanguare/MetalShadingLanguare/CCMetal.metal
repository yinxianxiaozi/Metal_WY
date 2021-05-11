//
//  CCMetal.metal
//  MetalShadingLanguare
//
//  Created by CC老师 on 2018/7/6.
//  Copyright © 2018年 CC老师. All rights reserved.
//

#include <metal_stdlib>

using namespace metal;

//函数修饰符.
/*
 3个函数修饰符:
 1. kernel : 并行计算函数
 2. vertex : 顶点函数
 3. fragment : 片元函数
 */


//1.并行计算函数(kernel)
kernel void CCTestKernelFunctionA(int a,int b)
{
    
    /*
     注意:
     1. 使用kernel 修饰的函数返回值必须是void 类型
     2. 一个被函数修饰符修饰过的函数,不允许在调用其他的被函数修饰过的函数. 非法
     3. 被函数修饰符修饰过的函数,只允许在客户端对齐进行操作. 不允许被普通的函数调用.
     */
    
    //不可以的!
    //一个被函数修饰符修饰过的函数,不允许在调用其他的被函数修饰过的函数. 非法
    CCTestKernelFunctionB(1,2);//非法
    CCTestVertexFunctionB(1,2);//非法
    
    //可以! 你可以调用普通函数.而且在Metal 不仅仅只有这3种被修饰过的函数.普通函数也可以存在
    CCTest();
    
}


kernel void CCTestKernelFunctionB(int a,int b)
{
    
    
}

//顶点函数
vertex int CCTestVertexFunctionB(int a,int b){
    
}

//片元函数
fragment int CCTestVertexFunctionB(int a,int b){
    
}

//普通函数
void CCTest()
{
    
}

//变量/函数参数地址空间修饰符
/*
 1.device
 2.threadgroup
 3.constant
 4.thread
 */

/*
 注意:
 1. 所有被(kernel,vertex,fragment)所修饰的参数变量,如果其类型是指针/引用 都必须带有地址空间修饰符.
 2. 被fragment修饰的片元函数, 指针/引用必须被device/constant/threadgroup
 */

//变量/参数地址空间修饰符
void CCTestFouncitionE(device int *g_data,
                       threadgroup int *l_data,
                       constant float *c_data
                       )
{
    //...
    
}

// 设备地址空间: device 用来修饰指针.引用
//1.修饰指针变量
device float4 *color;

struct CCStruct{
    float a[3];
    int b[2];
};
//2.修饰结构体类的指针变量
device CCStruct *my_CS;

/*
 1. threadgroup 被并行计算计算分配内存变量, 这些变量被一个线程组的所有线程共享. 在线程组分配变量不能被用于图像绘制.
 2. thread 指向每个线程准备的地址空间. 在其他线程是不可见切不可用的
 */
kernel void CCTestFouncitionF(threadgroup float *a)
{
    //在线程组地址空间分配一个浮点类型变量x
    threadgroup float x;
    
    //在线程组地址空间分配一个10个浮点类型数的数组y;
    threadgroup float y[10];
    
}

constant float sampler[] = {1.0f,2.0f,3.0f,4.0f};
kernel void CCTestFouncitionG(void)
{
    //在线程空间分配空间给x,p
    float x;
    thread float p = &x;
    
}

//常量地址修饰空间
//constant 显存,但是它是只读.


//属性修饰符
/*
 1. device buffer(设备缓存)
 2. constant buffer(常量缓存)
 3. texture Object(纹理对象)
 4. sampler Object(采样器对象)
 5. 线程组 threadgroup
 
 属性修饰符目的:
 1. 参数表示资源如何定位? 可以理解为端口
 2. 在固定管线和可编程管线进行内建变量的传递
 3. 将数据沿着渲染管线从顶点函数传递片元函数.
 
 在代码中如何表现:
 1.已知条件:device buffer(设备缓存)/constant buffer(常量缓存)
 代码表现:[[buffer(index)]]
 解读:不变的buffer ,index 可以由开发者来指定.
 
 2.已知条件:texture Object(纹理对象)
 代码表现: [[texture(index)]]
 解读:不变的texture ,index 可以由开发者来指定.
 
 3.已知条件:sampler Object(采样器对象)
 代码表示: [[sampler(index)]]
 解读:不变的sampler ,index 可以由开发者来指定.
 
 4.已知条件:threadgroup Object(线程组对象)
 代码表示: [[threadgroup(index)]]
 解读:不变的threadgroup ,index 可以由开发者来指定.
 */

//并行计算着色器函数add_vectros ,实现2个设备地址空间中的缓存A与缓存B相加.然后将结果写入到缓存out.
//属性修饰符"(buffer(index))" 为着色函数参数设定了缓存的位置
//并行计算着色器函数add_vectros ,实现2个设备地址空间中的缓存A与缓存B相加.然后将结果写入到缓存out.
//属性修饰符"(buffer(index))" 为着色函数参数设定了缓存的位置
kernel void add_vectros(
                const device float4 *inA [[buffer(0)]],
                const device float4 *inB [[buffer(1)]],
                device float4 *out [[buffer(2)]]
                uint id[[thread_position_in_grid]])
{
    out[id] = inA[id] + inB[id];
}


//着色函数的多个参数使用不同类型的属性修饰符的情况
kernel void my_kernel(device float4 *p [[buffer(0)]],
                      texture2d<float> img [[texture(0)]],
                      sampler sam [[sampler(0)]])
{
    //.....
    
}















