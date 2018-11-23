//
//  HLM3U8Constant.h
//  HLHLS
//
//  Created by hl on 16/10/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#ifndef HLM3U8Constant_h
#define HLM3U8Constant_h

#define kM3U8ConstantProgramSegmentDefaultCount     5
#define kM3U8ConstantPlaylistProgramDefaultCount    10

#define kM3U8KeyM3U8            @"#EXTM3U"

//Variables playlist
#define kM3U8KeyVariablesPlist  @"#EXT-X-STREAM-INF"
#define kM3U8KeyProgramID       @"PROGRAM-ID"
#define kM3U8KeyBandwidth       @"BANDWIDTH"
#define kM3U8KeyCodecs          @"CODECS"
#define kM3U8KeyResolution      @"RESOLUTION"
#define kM3U8KeyName            @"NAME"
#define kM3U8KeyDuration        @"DURATION"
#define kM3U8KeyURI             @"URI"

//Segment playlist
#define kM3U8KeySegment        @"#EXTINF"
#define kM3U8KeyPlistend       @"#EXT-X-ENDLIST"
#endif /* HLM3U8Constant_h */
