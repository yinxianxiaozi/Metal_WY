//
//  ViewController.m
//  002-BasicTexture
//
//  Created by CC老师 on 2018/8/15.
//  Copyright © 2018年 CC老师. All rights reserved.
//

#import "ViewController.h"
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
    
    //获取MTKView
    _view = (MTKView *)self.view;
    
    //一个MTLDevice 对象就代表这着一个GPU,通常我们可以调用方法MTLCreateSystemDefaultDevice()来获取代表默认的GPU单个对象.
    _view.device = MTLCreateSystemDefaultDevice();
    
    if(!_view.device)
    {
        NSLog(@"Metal is not supported on this device");
        return;
    }
    
    //创建CCRender
    _renderer = [[CCRenderer alloc] initWithMetalKitView:_view];
    
    if(!_renderer)
    {
        NSLog(@"Renderer failed initialization");
        return;
    }
    
    //用视图大小初始化渲染器
    [_renderer mtkView:_view drawableSizeWillChange:_view.drawableSize];
    
    //设置MTKView代理
    _view.delegate = _renderer;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
