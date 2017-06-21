//
//  NSFileManager+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/21.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (DXHelper)
+ (nullable NSArray<NSURL *> *)contentsOfDirectoryAtURL:(NSURL *)url includingPropertiesForKeys:(nullable NSArray<NSURLResourceKey> *)keys options:(NSDirectoryEnumerationOptions)mask error:(NSError **)error;

+ (NSArray<NSURL *> *)URLsForDirectory:(NSSearchPathDirectory)directory inDomains:(NSSearchPathDomainMask)domainMask;

+ (nullable NSURL *)URLForDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domain appropriateForURL:(nullable NSURL *)url create:(BOOL)shouldCreate error:(NSError **)error;

+ (BOOL)createDirectoryAtURL:(NSURL *)url withIntermediateDirectories:(BOOL)createIntermediates attributes:(nullable NSDictionary<NSFileAttributeKey, id> *)attributes error:(NSError **)error;

+ (BOOL)createSymbolicLinkAtURL:(NSURL *)url withDestinationURL:(NSURL *)destURL error:(NSError **)error;

+ (BOOL)setAttributes:(NSDictionary<NSFileAttributeKey, id> *)attributes ofItemAtPath:(NSString *)path error:(NSError **)error;

+ (BOOL)createDirectoryAtPath:(NSString *)path withIntermediateDirectories:(BOOL)createIntermediates attributes:(nullable NSDictionary<NSFileAttributeKey, id> *)attributes error:(NSError **)error;

+ (nullable NSArray<NSString *> *)contentsOfDirectoryAtPath:(NSString *)path error:(NSError **)error;

+ (nullable NSArray<NSString *> *)subpathsOfDirectoryAtPath:(NSString *)path error:(NSError **)error;

+ (nullable NSDictionary<NSFileAttributeKey, id> *)attributesOfItemAtPath:(NSString *)path error:(NSError **)error;

+ (nullable NSDictionary<NSFileAttributeKey, id> *)attributesOfFileSystemForPath:(NSString *)path error:(NSError **)error;

+ (BOOL)createSymbolicLinkAtPath:(NSString *)path withDestinationPath:(NSString *)destPath error:(NSError **)error;

+ (nullable NSString *)destinationOfSymbolicLinkAtPath:(NSString *)path error:(NSError **)error;

+ (BOOL)copyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **)error;

+ (BOOL)moveItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **)error;

+ (BOOL)linkItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **)error;

+ (BOOL)removeItemAtPath:(NSString *)path error:(NSError **)error;

+ (BOOL)copyItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError **)error;
+ (BOOL)moveItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError **)error;
+ (BOOL)linkItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError **)error;
+ (BOOL)removeItemAtURL:(NSURL *)URL error:(NSError **)error ;


@property (readonly, copy, class) NSString *currentDirectoryPath;
+ (BOOL)changeCurrentDirectoryPath:(NSString *)path;

+ (BOOL)fileExistsAtPath:(NSString *)path;
+ (BOOL)fileExistsAtPath:(NSString *)path isDirectory:(nullable BOOL *)isDirectory;
+ (BOOL)isReadableFileAtPath:(NSString *)path;
+ (BOOL)isWritableFileAtPath:(NSString *)path;
+ (BOOL)isExecutableFileAtPath:(NSString *)path;
+ (BOOL)isDeletableFileAtPath:(NSString *)path;

+ (NSString *)displayNameAtPath:(NSString *)path;

+ (nullable NSArray<NSString *> *)componentsToDisplayForPath:(NSString *)path;

+ (nullable NSDirectoryEnumerator<NSString *> *)enumeratorAtPath:(NSString *)path;


+ (nullable NSDirectoryEnumerator<NSURL *> *)enumeratorAtURL:(NSURL *)url includingPropertiesForKeys:(nullable NSArray<NSURLResourceKey> *)keys options:(NSDirectoryEnumerationOptions)mask errorHandler:(nullable BOOL (^)(NSURL *url, NSError *error))handler API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));

+ (nullable NSArray<NSString *> *)subpathsAtPath:(NSString *)path;

+ (nullable NSData *)contentsAtPath:(NSString *)path;
+ (BOOL)createFileAtPath:(NSString *)path contents:(nullable NSData *)data attributes:(nullable NSDictionary<NSFileAttributeKey, id> *)attr;
@end

NS_ASSUME_NONNULL_END
