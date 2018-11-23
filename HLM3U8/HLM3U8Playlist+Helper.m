//
//  HLM3U8Playlist+Helper.m
//  HLHLSExample
//
//  Created by hl on 17/10/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import "HLM3U8Playlist+Helper.h"
#import "HLM3U8Serialization.h"

@implementation HLM3U8Playlist (Helper)
+ (instancetype)playlistWithFilePath:(NSString *)filepath baseURL:(NSString *)url;
{
    return [HLM3U8Serialization m3u8PlaylistWithFilePath:filepath
                                                 baseURL:url
                                                   error:nil];
}

+ (instancetype)playlistWithString:(NSString *)string baseURL:(NSString *)url;
{
    return [HLM3U8Serialization m3u8PlaylistWithString:string
                                               baseURL:url
                                                 error:nil];
}
+ (instancetype)playlistWithData:(NSData *)data baseURL:(NSString *)url;
{
    return [HLM3U8Serialization m3u8PlaylistWithData:data
                                             baseURL:url
                                               error:nil];
}

@end
