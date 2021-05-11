//
//  CCRenderer.h
//  002-BasicTexture
//
//  Created by CC老师 on 2018/8/15.
//  Copyright © 2018年 CC老师. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MetalKit;

@interface CCRenderer : NSObject<MTKViewDelegate>

- (nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)mtkView;

@end
