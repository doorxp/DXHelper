//
//  HLM3U8Serialization.m
//  HLHLS
//
//  Created by hl on 17/10/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import "HLM3U8Serialization.h"
#import "HLM3U8Constant.h"
#import "HLM3U8SegmentBase.h"
#import "HLM3U8Playlist.h"

@implementation HLM3U8Serialization

#pragma mark -- helper

+ (BOOL)isValidM3U8Data:(NSData *)data;
{
    NSString * str = [[NSString alloc] initWithData:data
                                           encoding:NSUTF8StringEncoding];
    
    return [self isValidM3U8String:str];
}
+ (BOOL)isValidM3U8String:(NSString *)string;
{
    return [string hasPrefix:kM3U8KeyM3U8];
}

+ (BOOL)isValidM3U8File:(NSString *)filepath;
{
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filepath];
    NSData *fileData = [handle readDataOfLength:7];
    [handle closeFile];
    
    return [self isValidM3U8Data:fileData];
}
#pragma mark -- init

+ (HLM3U8Playlist *)m3u8PlaylistWithURL:(NSString *)url error:(NSError **)error;
{
    NSString * str = [NSString stringWithContentsOfURL:[NSURL URLWithString:url]
                                              encoding:NSUTF8StringEncoding
                                                 error:error];
    if (error) {
        return nil;
    }
    
    HLM3U8Playlist * playlist = [self m3u8PlaylistWithString:str
                                                     baseURL:url
                                                       error:error];
    playlist.urlString = url;
    return playlist;
    
}

+ (void)updatePlaylist:(HLM3U8Playlist*)playlist error:(NSError **)error;
{
    NSString * url = [playlist urlString];
    NSString * str = [NSString stringWithContentsOfURL:[NSURL URLWithString:url]
                                              encoding:NSUTF8StringEncoding
                                                 error:error];
    if (error || !str) {
        return;
    }
    
    [self updatePlaylist:playlist
           withLineArray:[self lineArrayFromString:str]];
    
}

+ (HLM3U8Playlist *)m3u8PlaylistWithData:(NSData *)data
                                   baseURL:(NSString *)url
                                   error:(NSError **)error;
{
    return [self parseWithData:data baseURL:url];
}

+ (HLM3U8Playlist *)m3u8PlaylistWithFilePath:(NSString *)filepath
                                       baseURL:(NSString *)url
                                       error:(NSError **)error;
{
    return [self parseWithFilePath:filepath
                           baseURL:url];
}
+ (HLM3U8Playlist *)m3u8PlaylistWithString:(NSString *)string
                                   baseURL:(NSString *)url
                                     error:(NSError **)error;
{
    return [self parseWithString:string baseURL:url];
}



#pragma mark - 解析相关

#pragma mark - 获取行信息
+ (HLM3U8Playlist *)parseWithFilePath:(NSString *)filePath baseURL:(NSString *)url;
{
    return [self updateFromLineArray:[self lineArrayFromFilePath:filePath]
                             baseURL:url];
}

+ (HLM3U8Playlist *)parseWithData:(NSData *)data baseURL:(NSString *)url;
{
    return [self updateFromLineArray:[self lineArrayFromData:data]
                             baseURL:url];
}

+ (HLM3U8Playlist *)parseWithString:(NSString *)string baseURL:(NSString *)url;
{
    return [self updateFromLineArray:[self lineArrayFromString:string]
                             baseURL:url];
}

+ (NSArray *) lineArrayFromFilePath:(NSString *)filePath;
{
    NSString * str = [NSString stringWithContentsOfFile:filePath
                                               encoding:NSUTF8StringEncoding
                                                  error:nil];
    return [self lineArrayFromString:str];
}

+ (NSArray *) lineArrayFromData:(NSData *)data;
{
    NSString * str = [[NSString alloc] initWithData:data
                                           encoding:NSUTF8StringEncoding];
    
    return [self lineArrayFromString:str];
}

+ (NSArray *) lineArrayFromString:(NSString *)string;
{
    NSAssert(string != nil, @"lineArrayFromString");
    if (!string || [string length] < 5) {
        return nil;
    }
    
    return [string componentsSeparatedByCharactersInSet:
            [NSCharacterSet newlineCharacterSet]];
}

#pragma mark - 按照行信息解析
+ (HLM3U8Playlist *)updateFromLineArray:(NSArray *)lineArray baseURL:(NSString *)url;
{
    HLM3U8Playlist * playlist = [HLM3U8Playlist new];
    playlist.urlString = url;
    
    [self updatePlaylist:playlist
           withLineArray:lineArray];
    
    return playlist;
}

+ (void)updatePlaylist:(HLM3U8Playlist*)playlist withLineArray:(NSArray *)lineArray;
{
    if (!lineArray) {
        return;
    }
    HLM3U8SegmentBase * segment = nil;
    
    for (NSString * lineStr in lineArray) {
        //空行
        if (!lineStr||[lineStr length]<2) {
            continue;
        }
        if ([lineStr hasPrefix:@"#"]) {
            if ([lineStr hasPrefix:kM3U8KeySegment]) {
                segment = [self readSegmentInfoFromLine:lineStr];
            }else if ([lineStr hasPrefix:kM3U8KeyVariablesPlist]) {
                segment = [self readVariablesPlistInfoFromLine:lineStr];
                HLM3U8Playlist * playlist = (HLM3U8Playlist * )segment;
                if (!playlist.programid) {
                    playlist.programid = @"2222";
                }
            }
        } else {
            [segment updateURLBase:playlist.uri];
            [segment updateURL:lineStr playListUrl:playlist.urlString];
            
            [playlist addSegment:segment];
            segment = nil;
        }
    }
    
    //默认解析第一个sub playlist
    if([playlist isVariantPlaylist]){
        HLM3U8Program * aprogram =[playlist programWithResolution:nil];
        HLM3U8Playlist * playlist = [aprogram playListForResolution:nil];
        [self updatePlaylist:playlist error:nil];
    }
}

+(HLM3U8Playlist *)readVariablesPlistInfoFromLine:(NSString *)line;
{
    NSDictionary * info = [self dictionaryInfoLine:line];
    
    HLM3U8Playlist * playlist = [HLM3U8Playlist new];
//    [playlist updateInfo:info];
    [playlist yy_modelSetWithDictionary:info];
    return playlist;
}

+(HLM3U8Segment *)readSegmentInfoFromLine:(NSString *)line;
{
    NSDictionary * info = [self dictionaryInfoLine:line];
    HLM3U8Segment * segment = [HLM3U8Segment new];
    [segment updateInfo:info];
    return segment;
}

+ (NSDictionary *)dictionaryInfoLine:(NSString*)line;
{
    NSArray * arr = [line componentsSeparatedByString:@":"];
    NSAssert([arr count]==2, @"必须两边");
    NSString * infoString = [arr lastObject];
    
    return [self dictionaryInfoFromString:infoString];
}

+ (NSDictionary *)dictionaryInfoFromString:(NSString*)infoString;
{
    NSMutableDictionary *mutableParameterDictionary = [[NSMutableDictionary alloc] init];
    
    NSArray *parameters = [infoString componentsSeparatedByString:@","];
    
    for (NSString *parameter in parameters) {
        if ([parameter length] < 1) {
            continue;
        }
        
        NSArray<NSString *> *keyValuePair = [parameter componentsSeparatedByString:@"="];
        
        if (keyValuePair.count == 2) {
            NSString *key = keyValuePair[0];
            NSString *value = keyValuePair[1];
            [mutableParameterDictionary setObject:value forKey:key];
        }else{
            //暂时只有duration没有添加key
            [mutableParameterDictionary setObject:parameter forKey:kM3U8KeyDuration];
        }
    }
    
    return [mutableParameterDictionary copy];
}
@end
