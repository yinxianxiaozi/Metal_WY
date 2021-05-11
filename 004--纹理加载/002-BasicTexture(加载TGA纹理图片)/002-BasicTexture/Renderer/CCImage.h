//
//  CCImage.h
//  002-BasicTexture
//
//  Created by CC老师 on 2018/8/15.
//  Copyright © 2018年 CC老师. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCImage : NSObject

//图片的宽高,以像素为单位
@property(nonatomic,readonly)NSUInteger width;
@property(nonatomic,readonly)NSUInteger height;

//图片数据每像素32bit,以BGRA形式的图像数据(相当于MTLPixelFormatBGRA8Unorm)
@property(nonatomic,readonly)NSData *data;

//通过加载一个简单的TGA文件初始化这个图像.只支持32bit的TGA文件
-(nullable instancetype) initWithTGAFileAtLocation:(nonnull NSURL *)location;

@end
