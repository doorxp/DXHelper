//
//  NSAttributedString+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "NSAttributedString+DXHelper.h"
#import "NSObject+DXHelper.h"

@implementation NSAttributedString (DXHelper)
+ (instancetype)string:(NSString *)str attributes:(NSDictionary *)attributes {
     return [[self alloc] initWithString:str attributes:attributes];
}

- (id)data {
    if ([self instancesRespondToSelector:@selector(dataFromRange:documentAttributes:error:)]) {
        NSDictionary *options =
        @{
          NSDocumentTypeDocumentAttribute:NSRTFDTextDocumentType,
          NSCharacterEncodingDocumentAttribute:@(NSUTF8StringEncoding)
          };
        
        
        NSData *retData =
        [self dataFromRange:NSMakeRange(0, [self length])
         documentAttributes:options
                      error:nil];
        return retData;
    }
    else {
        return  nil;
    }
}

- (CGSize)sizeForWidth:(CGFloat)width font:(UIFont *)font {
    CGRect r = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                  options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                  context:nil];
    return r.size;
}

- (void)appending:(NSString *)str attributes:(NSDictionary *)attributes {
    
}
@end
