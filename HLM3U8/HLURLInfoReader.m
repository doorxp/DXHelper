//
//  HLURLInfoReader.m
//  HLHLSExample
//
//  Created by hl on 01/11/2017.
//  Copyright © 2017 HL. All rights reserved.
//

#import "HLURLInfoReader.h"


@implementation HLURLInfoReader
+(void)readr:(NSString *)url callback:(HLURLInfoCallback)callback;
{
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:
                                     [NSURL URLWithString:url]];
    [request setHTTPMethod:@"HEAD"];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                     completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                         if (callback) { callback(url,response.MIMEType,response.expectedContentLength,error);
                                         }
                                     }] resume];
    
}
@end
