//
//  HLM3U8Info.h
//  HLHLS
//
//  Created by hl on 16/10/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HLM3U8SegmentBase.h"

/*!
 * @class           HLM3U8Playlist
 *
 * @abstract        playlist主文件
 *
 * @discussion      之所以从segmetbase继承，是由于playlist可能嵌套，分为多个不同分辨率的playlist
 *                  直播的需要不断刷新更新ts地址--暂时不考虑处理
 *                  只处理以及获取的
 *                  ?? 什么时候去解析sub playlist
 *
 */

//由于Variant playlist，的sub playlist需要单独的解析，这里需要成功用库

typedef void(^HLM3U8SegmentsCallback)(HLM3U8Segment * arr);
@interface HLM3U8Playlist : HLM3U8SegmentBase

@property (nonatomic, strong) NSString * uniqueID;
@property (nonatomic, strong) NSString * version;
@property (nonatomic) BOOL isDecode;      //VariablesPlist分了分辨率了subplaylist，并不是以获取就全部解析，造成没必要浪费，lazyload

- (BOOL) isVariantPlaylist;
- (void)addSegment:(HLM3U8SegmentBase*)segment;

- (NSArray *)segmentsListWithResolution:(id)resolution;
- (NSArray *)urlStringForResolution:(id)resolution;
- (HLM3U8Program*)programWithResolution:(id)resolution;

- (NSString *)uri;
@end

