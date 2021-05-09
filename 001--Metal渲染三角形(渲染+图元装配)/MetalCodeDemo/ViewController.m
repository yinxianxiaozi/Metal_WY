//
//  ViewController.m
//  MetalCodeDemo
//
/*
    Metal学习----绘制三角形
    学习：
        1、图元绘制流程
        2、着色器的使用流程
        3、.metal文件和.h文件的认识
 */
//  Created by CC老师 on 2018/5/28.
//  Copyright © 2018年 CC老师. All rights reserved.
//

#import "ViewController.h"
//导入MetalKit 工具类
@import MetalKit;
#import "CCRenderer.h"

@interface ViewController ()
{
    MTKView *_view;
    
    CCRenderer *_renderer;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Set the view to use the default device
    _view = (MTKView *)self.view;
    _view.device = MTLCreateSystemDefaultDevice();
    
    if(!_view.device)
    {
        NSLog(@"Metal is not supported on this device");
        return;
    }
    
    _renderer = [[CCRenderer alloc] initWithMetalKitView:_view];
    
    if(!_renderer)
    {
        NSLog(@"Renderer failed initialization");
        return;
    }
    
    // Initialize our renderer with the view size
    [_renderer mtkView:_view drawableSizeWillChange:_view.drawableSize];
    
    _view.delegate = _renderer;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
