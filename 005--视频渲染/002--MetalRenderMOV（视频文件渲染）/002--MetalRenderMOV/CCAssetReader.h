//
//  CCAssetReader.h
//  002--MetalRenderMOV
//
//  Created by CC老师 on 2019/5/7.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface CCAssetReader : NSObject

//初始化
- (instancetype)initWithUrl:(NSURL *)url;

//从MOV文件读取CMSampleBufferRef 数据
- (CMSampleBufferRef)readBuffer;

@end
