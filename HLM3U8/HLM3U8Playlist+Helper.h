//
//  HLM3U8Playlist+Helper.h
//  HLHLSExample
//
//  Created by hl on 17/10/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import "HLM3U8Playlist.h"

@interface HLM3U8Playlist (Helper)
+ (instancetype)playlistWithFilePath:(NSString *)filepath baseURL:(NSString *)url;
+ (instancetype)playlistWithString:(NSString *)string baseURL:(NSString *)url;
+ (instancetype)playlistWithData:(NSData *)data baseURL:(NSString *)url;
@end
