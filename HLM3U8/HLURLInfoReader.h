//
//  HLURLInfoReader.h
//  HLHLSExample
//
//  Created by hl on 01/11/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HLURLInfoMiniTypeM3U8 @"application/vnd.apple.mpegurl"

/*!
 * class           HLURLInfoReader
 *
 * @abstract        对去URL指定的数据信息，大小，格式等
 *
 * @discussion      异步对于URL指定的数据信息，如文件大小，格式
 *
 */

typedef void(^HLURLInfoCallback)(NSString* url,
                                 NSString* minitype,
                                 NSInteger size,
                                 NSError *error);

@interface HLURLInfoReader : NSObject
+ (void)readr:(NSString *)url callback:(HLURLInfoCallback)callback;
@end
