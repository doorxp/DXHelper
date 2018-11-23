//
//  HLM3U8Info.m
//  HLHLS
//
//  Created by hl on 16/10/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import "HLM3U8Playlist.h"
#import "HLM3U8Constant.h"

@interface HLM3U8Playlist ()
@property (nonatomic, strong) NSMutableDictionary * programs; //VariantPlaylist program id相同的为一组 key为program id； value HLM3U8Program

@property (nonatomic, strong) NSMutableArray * segments; //非Variant PlayList，直接保存Segment
@end

@implementation HLM3U8Playlist
#pragma mark - override
- (BOOL) isPlaylist;
{
    return YES;
}

- (NSString *) programid;
{
    NSString * supid = [super programid];
    if (supid) {
        return supid;
    }else{
        
        self.programid = @"1111";
    }
    
    return self.programid;
}

- (BOOL) isVariantPlaylist;
{
    return self.programs != nil;
}

- (NSString *)uri;
{
    
    if (self.urlString && [self.urlString containsString:@"http"]) {
        NSURL * url = [NSURL URLWithString:self.urlString];
        return [NSString stringWithFormat:@"%@://%@",url.scheme,url.host];
    }
    
    if (self.urlStringBase && [self.urlStringBase length] > 1) {
        return self.urlStringBase;
    }

    return nil;
    
}
#pragma mark -

- (void)addSegment:(HLM3U8SegmentBase*)segment;
{
    if ([segment isPlaylist]) {
        [self addSubPlaylist:(HLM3U8Playlist*)segment];
    }else{
        [self addSubSegment:(HLM3U8Segment*)segment];
    }

}

- (void)addSubPlaylist:(HLM3U8Playlist*)playlist;
{
    HLM3U8Program * program;
    @try {
         program = [self programForSegmentID:playlist.programid];
        
    } @catch (NSException *exception) {
        NSString * string =[NSString stringWithFormat:@"uri = :%@; baseURL = %@;url = %@",self.uri,self.urlStringBase,self.urlString];
        [MobClick event:@"200" label:string];
        playlist.programid = @"111111";
        program = [self programForSegmentID:playlist.programid];
    }
    
    [program addPlaylist:playlist];
    
}

- (void)addSubSegment:(HLM3U8Segment*)segment;
{
    if(!self.segments){
        self.segments = [NSMutableArray arrayWithCapacity:(NSUInteger)kM3U8ConstantPlaylistProgramDefaultCount];
    }
    
    [self.segments addObject:segment];
}


- (HLM3U8Program *)programForSegmentID:(NSString*)segmentID;
{
    if(!self.programs){
        self.programs = [NSMutableDictionary dictionaryWithCapacity:(NSUInteger)kM3U8ConstantPlaylistProgramDefaultCount];
    }
    
    HLM3U8Program * program = (HLM3U8Program *)[self.programs valueForKey:segmentID];
    if (!program) {
        program = [HLM3U8Program new];
        
        [self.programs setValue:program forKey:segmentID];
    }
    
    return program;
}

//
- (NSArray *)segmentsListWithResolution:(id)resolution;
{
    NSArray * arrs = nil;
    if ([self isVariantPlaylist]) {
        HLM3U8Program * aProgram = [[self.programs allValues] lastObject];
        HLM3U8Playlist * playlist = [aProgram playListForResolution:resolution];
        arrs = [playlist segmentsListWithResolution:resolution];
    }else{
        arrs = self.segments;
    }
    
    return arrs;
}

- (NSArray *)urlStringForResolution:(id)resolution;
{
    NSArray * segments = [self segmentsListWithResolution:resolution];
    NSMutableArray * ma = [NSMutableArray arrayWithCapacity:[segments count]];
    for (HLM3U8Segment * asegment in segments){
        [ma addObject:asegment.urlString];
    }
    return ma;
}

- (HLM3U8Program*)programWithResolution:(id)resolution;
{
    HLM3U8Program * aProgram = [[self.programs allValues] firstObject];
    return aProgram;
}

@end
