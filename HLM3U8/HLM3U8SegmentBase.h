//
//  HLM3U8SegmentInfo.h
//  HLHLS
//
//  Created by hl on 16/10/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HLM3U8DurationFloat
#ifdef HLM3U8DurationFloat
    #import <CoreGraphics/CGBase.h>
#endif
#import "YYModel.h"


/*!
 * @class           HLM3U8SegmentBase
 *
 * @abstract        片段基类--有可能指向ts文件，有可能会是playlist即还是M3u8文件
 *
 * @discussion      暂时只处理ts文件情况
 *
 */
@class HLM3U8Playlist;

@interface HLM3U8SegmentBase : NSObject
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * programid;
@property (nonatomic, strong) NSString * codecs;
@property (nonatomic, strong) NSString * resolution;
@property (nonatomic, strong) NSString * urlString;      //当前读取到的地址
@property (nonatomic, strong) NSString * urlStringBase; //解析地址基地址

@property (nonatomic) NSInteger bandwidth;
#ifdef HLM3U8DurationFloat
@property (nonatomic) CGFloat duration;
#else
@property (nonatomic) NSInteger duration;
#endif

//更具某个指标 resolution或者bandwidth来判断是否达标
- (BOOL) reachTheResolution:(id)resolution;
- (BOOL) isPlaylist;

//更新信息
- (void)updateURLBase:(NSString *)string;
- (void)updateURL:(NSString *)string;
- (void)updateURL:(NSString *)string playListUrl:(NSString *)playlistUrlString;
- (void)updateInfo:(NSDictionary*)dictionary;

@end

@interface HLM3U8Segment: HLM3U8SegmentBase

@end

@interface HLM3U8Program: NSObject
- (void) addPlaylist:(HLM3U8Playlist *)segment;
- (HLM3U8Playlist *) playListForResolution:(id)resolution;
@end;
