//
//  HLM3U8Serialization.h
//  HLHLS
//
//  Created by hl on 17/10/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HLM3U8Playlist;

@interface HLM3U8Serialization : NSObject
+ (BOOL)isValidM3U8Data:(NSData *)data;
+ (BOOL)isValidM3U8String:(NSString *)string;
+ (BOOL)isValidM3U8File:(NSString *)filepath;

//直接从网上获取m3u8数据
//如果是variant playlist优先解析默认分辨率
//解析过程暂时不考虑多线程问题--由调用方考虑
+ (HLM3U8Playlist *)m3u8PlaylistWithURL:(NSString *)url error:(NSError **)error;
+ (void)updatePlaylist:(HLM3U8Playlist*)playlist error:(NSError **)error;

+ (HLM3U8Playlist *)m3u8PlaylistWithData:(NSData *)data
                                   baseURL:(NSString *)url
                                   error:(NSError **)error;
+ (HLM3U8Playlist *)m3u8PlaylistWithString:(NSString *)string
                                   baseURL:(NSString *)url
                                     error:(NSError **)error;
+ (HLM3U8Playlist *)m3u8PlaylistWithFilePath:(NSString *)filepath
                                       baseURL:(NSString *)url
                                       error:(NSError **)error;
@end
