//
//  ViewController.m
//  MetalCodeDemo-00
//
/*
    Metal学习---基本渲染流程
    学习：
        1、载入Render
        2、Render的渲染流程
 */
//  Created by CC老师 on 2018/5/29.
//  Copyright © 2018年 CC老师. All rights reserved.
//

#import "ViewController.h"
#import "CCRenderer.h"

@interface ViewController ()
{
    MTKView *_view;//Metal视图
    CCRenderer *_render;//渲染类
  
}
@end

@implementation ViewController

/*
 1、先创建View
 2、设置view的device
 3、创建render
 4、设置代理
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1. 获取_view，这样就获取了一个MTKView
    _view = (MTKView *)self.view;
    
    //2.为_view 设置MTLDevice(必须)
    //一个MTLDevice 对象就代表这着一个GPU,通常我们可以调用方法MTLCreateSystemDefaultDevice()来获取代表默认的GPU单个对象.
    _view.device = MTLCreateSystemDefaultDevice();
    
    //3.判断是否设置成功
    if (!_view.device) {
        NSLog(@"Metal is not supported on this device");
        return;
    }
    
    //4. 创建CCRenderer
    //分开你的渲染循环:
    //在我们开发Metal 程序时,将渲染循环分为自己创建的类,是非常有用的一种方式,使用单独的类,我们可以更好管理初始化Metal,以及Metal视图委托.
    _render =[[CCRenderer alloc]initWithMetalKitView:_view];
    
    //5.判断_render 是否创建成功
    if (!_render) {
        NSLog(@"Renderer failed initialization");
        return;
    }
    
    //6.设置MTKView 的代理(由CCRender来实现MTKView 的代理方法)
    _view.delegate = _render;
    
    //7.视图可以根据视图属性上设置帧速率(指定时间来调用drawInMTKView方法--视图需要渲染时调用)
    _view.preferredFramesPerSecond = 60;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
