//
//  HLM3U8SegmentInfo.m
//  HLHLS
//
//  Created by hl on 16/10/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import "HLM3U8SegmentBase.h"
#import "NSDictionary+convert.h"
#import "HLM3U8Constant.h"
#import "YYModel.h"
#import "HLM3U8Playlist.h"

@implementation HLM3U8SegmentBase

//_programid      = [dictionary stringForKey:kM3U8KeyProgramID];
//_bandwidth      = [dictionary integerForKey:kM3U8KeyBandwidth];
//_resolution     = [dictionary stringNullableForKey:kM3U8KeyResolution];
//_codecs         = [dictionary stringForKey:kM3U8KeyCodecs];
//_name           = [dictionary stringForKey:kM3U8KeyName];
//_urlStringBase  = [dictionary stringForKey:kM3U8KeyURI];
//
//#ifdef HLM3U8DurationFloat
//_duration       = [dictionary CGFloatForKey:kM3U8KeyDuration];
//#else
//_duration       = [dictionary integerForKey:kM3U8KeyDuration];
//#endif

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name"        : kM3U8KeyName,
             @"programid"   : kM3U8KeyProgramID,
             @"bandwidth"   : kM3U8KeyBandwidth,
             @"resolution"  : kM3U8KeyResolution,
             
             @"codecs"        : kM3U8KeyCodecs,
             @"urlStringBase"   : kM3U8KeyURI,
             @"duration"   : kM3U8KeyDuration,
             
             };
}

- (BOOL) reachTheResolution:(id)resolution;
{
    return YES;
}

- (BOOL) isPlaylist;
{
    return self.programid != nil || [self.programid length] > 1;
}

- (void)updateURLBase:(NSString *)string;
{
    _urlStringBase = string;
}

- (void)updateURL:(NSString *)string;
{
    if(_urlStringBase && ![string hasPrefix:@"http"]){
        if ([string hasPrefix:@"/"]) {
            _urlString = [_urlStringBase stringByAppendingString:string];
        }else{
            _urlString = [NSString stringWithFormat:@"%@/%@",_urlStringBase,string];
        }
    }else{
        _urlString = string;
    }
}

- (void)updateURL:(NSString *)string playListUrl:(NSString *)playlistUrlString;
{
    //xvideos m3u8列表中的地址只有最后一组，不含"/"直接替换playlist的最后一位
    //替换最后一位
    if (![string containsString:@"/"]) {
        _urlString = [[playlistUrlString stringByDeletingLastPathComponent] stringByAppendingPathComponent:string];
    }else
    //用主域名加后缀
    if(_urlStringBase && ![string hasPrefix:@"http"]){
        if ([string hasPrefix:@"/"]) {
            _urlString = [_urlStringBase stringByAppendingString:string];
        }else{
            _urlString = [NSString stringWithFormat:@"%@/%@",_urlStringBase,string];
        }
    }else{
        _urlString = string;
    }
}

- (void)updateInfo:(NSDictionary*)dictionary;
{
    [self yy_modelSetWithDictionary:dictionary];
}

@end

@implementation HLM3U8Segment


@end

@interface HLM3U8Program ()
@property (nonatomic, strong) NSMutableArray * playlists;
@end
@implementation HLM3U8Program

- (instancetype)init;
{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)setup;
{
    self.playlists = [NSMutableArray arrayWithCapacity:kM3U8ConstantProgramSegmentDefaultCount];
}

- (void) addPlaylist:(HLM3U8Playlist *)segment;
{
    [self.playlists addObject:segment];
}

- (HLM3U8Playlist *) playListForResolution:(id)resolution;
{
    
    //sort要按照某一分辨率指标排序，然后取出最大的
    //第一个是默认分辨率，最后一个是最低分辨率
    return [self.playlists firstObject];
}

@end
