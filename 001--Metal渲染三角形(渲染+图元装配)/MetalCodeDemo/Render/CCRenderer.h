//
//  AAPLRenderer.h
//  MetalCodeDemo
//
//  Created by CC老师 on 2018/5/28.
//  Copyright © 2018年 CC老师. All rights reserved.
//


//导入MetalKit工具包
@import MetalKit;

//这是一个独立于平台的渲染类
//MTKViewDelegate协议:允许对象呈现在视图中并响应调整大小事件
@interface CCRenderer : NSObject<MTKViewDelegate>

//初始化一个MTKView
- (nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)mtkView;

@end
