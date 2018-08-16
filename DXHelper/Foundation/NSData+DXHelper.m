//
//  NSData+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "NSData+DXHelper.h"
#import <zlib.h>
#import <CommonCrypto/CommonCrypto.h>
#import "NSObject+DXHelper.h"

@import UIKit;

const NSUInteger ChunkSize = 1024;

@implementation NSData (DXHelper)

- (NSData *)zip:(int)windowsBits
{
    if (self.length < 1)
    {
        return nil;
    }
    
    z_stream c_stream;
    
    c_stream.zalloc = Z_NULL;
    c_stream.zfree = Z_NULL;
    c_stream.opaque = Z_NULL;
    c_stream.total_out = 0;
    
    
    if(deflateInit2(&c_stream,
                    Z_DEFAULT_COMPRESSION,
                    Z_DEFLATED,
                    windowsBits,
                    8,
                    Z_DEFAULT_STRATEGY) != Z_OK)
    {
        return nil;
    }
    
    c_stream.next_in = (Bytef *)self.bytes;
    c_stream.avail_in = (uInt)(self.length);
    
    NSMutableData *data = [NSMutableData dataWithLength:ChunkSize];
    
    while (c_stream.avail_in != 0)
    {
        if (c_stream.total_out >= [data length])
        {
            [data increaseLengthBy:ChunkSize];
        }
        
        c_stream.next_out = data.mutableBytes + c_stream.total_out;
        c_stream.avail_out = (uInt)(data.length - c_stream.total_out);
        
        int status = deflate(&c_stream, Z_NO_FLUSH);
        
        if (status < 0)
        {
            NSLog(@"deflate out error :%@", @(status));
            break;
        }
        else if (status == Z_STREAM_END)
        {
            break;
        }
    }
    
    for(; ;)
    {
        
        if (c_stream.total_out >= [data length])
        {
            [data increaseLengthBy:ChunkSize];
        }
        
        int status = deflate(&c_stream, Z_FINISH);
        
        c_stream.next_out = data.mutableBytes + c_stream.total_out;
        c_stream.avail_out = (uInt)(data.length - c_stream.total_out);
        
        if(status == Z_STREAM_END)
        {
            break;
        }
    }
    
    deflateEnd(&c_stream);
    
    [data setLength:c_stream.total_out];
    
    return data;
}

- (NSData *)unzip:(int)windowsBits
{
    if(self.length < 1)
    {
        return 0;
    }
    
    Bytef *inData = (Bytef *)self.bytes;
    
    bool done = false;
    int status = 0;
    z_stream d_strm;
    d_strm.next_in = inData;
    d_strm.avail_in = (uInt)self.length;
    d_strm.total_out = 0;
    d_strm.opaque = 0;
    d_strm.zalloc = Z_NULL;
    d_strm.zfree = Z_NULL;
    if(inflateInit2(&d_strm, windowsBits) != Z_OK)
    {
        return nil;
    }
    
    Bytef buffer[ChunkSize];
    NSMutableData *retData = [NSMutableData data];
    
    uLong totalLen = 0;
    while(!done)
    {
        bzero(buffer, ChunkSize);
        
        d_strm.avail_out = ChunkSize;
        d_strm.next_out = buffer;
        status = inflate(&d_strm, Z_NO_FLUSH);
        
        if(status == Z_STREAM_END || d_strm.avail_in == 0)
        {
            done = true;
        }
        else if(status != Z_OK)
        {
            break;
        }
        
        [retData appendBytes:(char *)buffer length:d_strm.total_out - totalLen];
        totalLen = d_strm.total_out;
    }
    
    inflateEnd(&d_strm);
    
    if(done)
    {
        return retData;
    }
    else
    {
        return nil;
    }
}

- (NSData *)gzippedData
{
    
    return [self zip:-MAX_WBITS];
    
}

- (NSData *)gunzippedData
{
    return [self unzip:-MAX_WBITS];
}

- (NSData *)gzippedDataForAndroid
{
    return [self zip:(15+16)];
}

- (NSData *)gunzippedDataForAndroid
{
    return [self unzip:(15+32)];
}

typedef CCCryptorStatus (*MyCrypt)(
                                   CCOperation op,         /* kCCEncrypt, etc. */
                                   CCAlgorithm alg,        /* kCCAlgorithmAES128, etc. */
                                   CCOptions options,      /* kCCOptionPKCS7Padding, etc. */
                                   const void *key,
                                   size_t keyLength,
                                   const void *iv,         /* optional initialization vector */
                                   const void *dataIn,     /* optional per op and alg */
                                   size_t dataInLength,
                                   void *dataOut,          /* data RETURNED here */
                                   size_t dataOutAvailable,
                                   size_t *dataOutMoved);

- (NSData *)encrypt:(CCOperation)encryptOperation
                key:(NSString *)key
{
    size_t dataInLength = [self length];
    
    //   CCCryptorStatus ccStatus;
    char *dataOut = NULL;
    size_t dataOutAvailable = 0;
    size_t dataOutMoved = 0;
    
    dataOutAvailable = (dataInLength + (kCCBlockSizeDES-1)) & ~(kCCBlockSizeDES-1);
    dataOut = (char*)malloc(dataOutAvailable);
    memset((void *)dataOut, 0x0, dataOutAvailable);
    
    //控制长度，长度低于规定长度填充
    char vkey[kCCKeySizeDES + 1];
    bzero(vkey, kCCKeySizeDES + 1);
    memcpy(vkey, [key UTF8String],  MIN(key.length, kCCKeySizeDES));
    
    const char *srcData = (const char *)self.bytes;
    
    char iv[9];
    bzero(iv, 9);
    
    if (encryptOperation == kCCEncrypt) {
        for (int i = 0; i<8; i++) {
            iv[i] = (char)('A' + arc4random_uniform(26));
        }
    }
    else {
        bcopy(srcData, iv, 8);
        srcData += 8;
        dataInLength -= 8;
    }
    
    
    //CCCrypt函数 加密/解密
    //ccStatus =
    CCCrypt(encryptOperation,    // 加密/解密
           kCCAlgorithmDES,
           kCCOptionPKCS7Padding,
           vkey,                // 密钥
           kCCKeySizeDES,
           iv,                 // 可选的初始矢量
           srcData,              // 数据的存储单元
           dataInLength,        // 数据的大小
           (void *)dataOut,     // 用于返回数据
           dataOutAvailable,
           &dataOutMoved);
    
    //去掉填充
    while (dataOut[dataOutMoved-1] == '\0' && dataOutMoved>0)
    {
        dataOutMoved --;
    }
    
    NSMutableData *data = [NSMutableData data];
    if (encryptOperation == kCCEncrypt) {
        [data appendBytes:iv length:8];
    }
    
    [data appendBytes:dataOut length:(NSUInteger)dataOutMoved];
    
    free(dataOut);
    
    return data;
}

- (NSData *)encryptWithKey:(NSString *)key
{
    
    return [self encrypt:kCCEncrypt key:key];
}

- (NSData *)decryptWithKey:(NSString *)key
{
    return [self encrypt:kCCDecrypt key:key];
}

- (id)jsonObject
{
    return [NSJSONSerialization JSONObjectWithData:self
                                           options:NSJSONReadingAllowFragments
                                             error:nil];
}

- (NSString *)string
{
    return [[NSString alloc] initWithData:self
                                 encoding:NSUTF8StringEncoding];
}


- (NSString *)encodeBase64 {
    if ([self instancesRespondToSelector:@selector(base64EncodedStringWithOptions:)]) {
        return [self base64EncodedStringWithOptions:0];
    }
    else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        return  [self base64Encoding];
#pragma clang diagnostic pop
    }
}

- (NSAttributedString*)html:(NSDictionary *)defAttributs {
    if ([NSAttributedString instancesRespondToSelector:@selector(initWithData:options:documentAttributes:error:)]) {
        NSDictionary *options =
        @{
          NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,
          NSCharacterEncodingDocumentAttribute:@(NSUTF8StringEncoding)
          };
        
        __block NSMutableAttributedString *retStr = nil;
        
        if ([NSThread isMainThread]) {
            retStr =
            [[NSMutableAttributedString alloc] initWithData:self
                                                    options:options
                                         documentAttributes:nil
                                                      error:nil];
            if (!!defAttributs) {
                [retStr addAttributes:defAttributs range:NSMakeRange(0, retStr.length)];
            }
            
        }
        else {
            dispatch_sync(dispatch_get_main_queue(), ^{
                retStr =
                [[NSMutableAttributedString alloc] initWithData:self
                                                        options:options
                                             documentAttributes:nil
                                                          error:nil];
                if (!!defAttributs) {
                    [retStr addAttributes:defAttributs range:NSMakeRange(0, retStr.length)];
                }
            });
        }
        return retStr;
    }
    else {
        return nil;
    }
}

- (NSAttributedString *)rtf {
    if ([NSAttributedString instancesRespondToSelector:@selector(initWithData:options:documentAttributes:error:)]) {
        NSDictionary *options =
        @{
          NSDocumentTypeDocumentAttribute:NSRTFDTextDocumentType,
          NSCharacterEncodingDocumentAttribute:@(NSUTF8StringEncoding)
          };
        
        NSAttributedString *retStr = nil;
        @try {
            retStr =
            [[NSAttributedString alloc] initWithData:self
                                             options:options
                                  documentAttributes:nil
                                               error:nil];
        } @catch (NSException *exception) {
            NSLog(@"%@",exception);
        } @finally {
            return retStr;
        }
    }
    else {
        return nil;
    }
}

@end
