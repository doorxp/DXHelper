//
//  NSString+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "NSString+DXHelper.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSObject+DXHelper.h"
#import "NSData+DXHelper.h"

@implementation NSString (DXHelper)
#pragma mark - URLEncode/Decode
//URL encode
- (NSString *)urlEncode
{
    if ([self instancesRespondToSelector:@selector(stringByAddingPercentEncodingWithAllowedCharacters:)]) {
        NSCharacterSet *set = [NSCharacterSet alphanumericCharacterSet];
        return [self stringByAddingPercentEncodingWithAllowedCharacters:set];
    }
    else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        NSString *chars = @"!*'();:@&=+$,/?%#[]";
        NSString *encodedString =
        (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes
                                      (NULL,
                                       (CFStringRef)self,
                                       NULL,
                                       (CFStringRef)chars,
                                       kCFStringEncodingUTF8));
        
        return encodedString;
#pragma clang diagnostic pop
    }
}

//URL decode
- (NSString *)urlDecode
{
    if ([self methodSignatureForSelector:@selector(stringByRemovingPercentEncoding)] != nil) {
        return [self stringByRemovingPercentEncoding];
    }
    else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
#pragma clang diagnostic pop
    }
}

- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)sha1
{
    const char *cstr = self.UTF8String;
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(cstr, (CC_LONG)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    
    NSMutableString* output = [NSMutableString string];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

- (NSData *)deccodeBase64 {
    
    if ([[NSData class] instancesRespondToSelector:@selector(initWithBase64EncodedString:options:)]) {
        NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
        return data;
    }
    else {
        return nil;
    }
}


- (id)jsonObject
{
    NSData *data = [NSData dataWithBytes:self.UTF8String length:[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding]];
    return [data jsonObject];
}

- (CGSize)sizeTo:(UIFont*)font constrainedToSize:(CGSize)cSize
{
    CGSize size;
    
    if ([[self class] instancesRespondToSelector:@selector(boundingRectWithSize:options:attributes:context:)])
    {
        CGRect r =
        [self boundingRectWithSize:cSize
                           options:0x1F
                        attributes:@{NSFontAttributeName:font}
                           context:nil];
        size = r.size;
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        size = [self sizeWithFont:font
                constrainedToSize:cSize
                    lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    }
    
    return CGSizeMake(round(size.width), round(size.height));
}

- (CGSize)sizeTo:(UIFont *)font
{
    return [self sizeTo:font constrainedToSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
}

- (NSData *)data
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSUInteger)unsignedIntegerValue
{
    return (NSUInteger)self.longLongValue;
}

- (NSAttributedString*)html:(NSDictionary *)defAttributs {
    return [self.data html:defAttributs];
}


- (NSAttributedString*)outlineString {
    NSShadow * shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowOffset = CGSizeMake(0, 0);
    shadow.shadowBlurRadius = 1.5;
    
    NSDictionary *attr =
    @{//NSShadowAttributeName:shadow,
      NSStrokeColorAttributeName:[UIColor blackColor],
      NSStrokeWidthAttributeName:@(-1.5),
      NSForegroundColorAttributeName:[UIColor whiteColor]
      };
    
    return
    [[NSAttributedString alloc] initWithString:self attributes:attr];
}

- (UIImage *)qrImage:(CGFloat)size {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [self data];
    [filter setValue:data forKey:@"inputMessage"];
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    CIImage *outPutImage = [filter outputImage];
    
    CGRect extent = CGRectIntegral(outPutImage.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
    
    outPutImage = [outPutImage imageByApplyingTransform:transform];
    
    UIImage *image = [UIImage imageWithCIImage:outPutImage];
    
    return image;
}

- (NSString *)localized {
    return NSLocalizedString(self, nil);
}

//- (NSString *)format:(id)arg0,... {
//    va_list ap;
//    va_start(ap, arg0);
//    va_list *ap1 = &ap -1;
//    NSString *ret = [[NSString alloc] initWithFormat:self arguments:*ap1];
//    va_end(ap);
//    return ret;
//}
@end
