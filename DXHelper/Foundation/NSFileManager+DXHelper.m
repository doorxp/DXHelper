//
//  NSFileManager+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/21.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "NSFileManager+DXHelper.h"

@implementation NSFileManager (DXHelper)
+ (nullable NSArray<NSURL *> *)contentsOfDirectoryAtURL:(NSURL *)url includingPropertiesForKeys:(nullable NSArray<NSURLResourceKey> *)keys options:(NSDirectoryEnumerationOptions)mask error:(NSError **)error {
    return [[NSFileManager defaultManager] contentsOfDirectoryAtURL:url includingPropertiesForKeys:keys options:mask error:error];
}

+ (NSArray<NSURL *> *)URLsForDirectory:(NSSearchPathDirectory)directory inDomains:(NSSearchPathDomainMask)domainMask {
    return [[NSFileManager defaultManager] URLsForDirectory:directory inDomains:domainMask];
}

+ (nullable NSURL *)URLForDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domain appropriateForURL:(nullable NSURL *)url create:(BOOL)shouldCreate error:(NSError **)error {
    return [[NSFileManager defaultManager] URLForDirectory:directory inDomain:domain appropriateForURL:url create:shouldCreate error:error];
}

+ (BOOL)createDirectoryAtURL:(NSURL *)url withIntermediateDirectories:(BOOL)createIntermediates attributes:(nullable NSDictionary<NSFileAttributeKey, id> *)attributes error:(NSError **)error {
    return [[NSFileManager defaultManager] createDirectoryAtURL:url withIntermediateDirectories:createIntermediates attributes:attributes error:error];
}

+ (BOOL)createSymbolicLinkAtURL:(NSURL *)url withDestinationURL:(NSURL *)destURL error:(NSError **)error {
    return [[NSFileManager defaultManager] createSymbolicLinkAtURL:url withDestinationURL:destURL error:error];
}

+ (BOOL)setAttributes:(NSDictionary<NSFileAttributeKey, id> *)attributes ofItemAtPath:(NSString *)path error:(NSError **)error {
   return [[NSFileManager defaultManager] setAttributes:attributes ofItemAtPath:path error:error];
}

+ (BOOL)createDirectoryAtPath:(NSString *)path withIntermediateDirectories:(BOOL)createIntermediates attributes:(nullable NSDictionary<NSFileAttributeKey, id> *)attributes error:(NSError **)error {
    return [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:createIntermediates attributes:attributes error:error];
}

+ (nullable NSArray<NSString *> *)contentsOfDirectoryAtPath:(NSString *)path error:(NSError **)error {
    return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:error];
}

+ (nullable NSArray<NSString *> *)subpathsOfDirectoryAtPath:(NSString *)path error:(NSError **)error {
    return [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:path error:error];
}

+ (nullable NSDictionary<NSFileAttributeKey, id> *)attributesOfItemAtPath:(NSString *)path error:(NSError **)error {
    return [[NSFileManager defaultManager] attributesOfItemAtPath:path error:error];
}

+ (nullable NSDictionary<NSFileAttributeKey, id> *)attributesOfFileSystemForPath:(NSString *)path error:(NSError **)error {
    return [[NSFileManager defaultManager] attributesOfFileSystemForPath:path error:error];
}

+ (BOOL)createSymbolicLinkAtPath:(NSString *)path withDestinationPath:(NSString *)destPath error:(NSError **)error {
    return [[NSFileManager defaultManager] createSymbolicLinkAtPath:path withDestinationPath:destPath error:error];
}

+ (nullable NSString *)destinationOfSymbolicLinkAtPath:(NSString *)path error:(NSError **)error {
    return [[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:path error:error];
}

+ (BOOL)copyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **)error {
    return [[NSFileManager defaultManager] copyItemAtPath:srcPath toPath:dstPath error:error];
}

+ (BOOL)moveItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **)error {
    return [[NSFileManager defaultManager] moveItemAtPath:srcPath toPath:dstPath error:error];
}

+ (BOOL)linkItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **)error {
    return [[NSFileManager defaultManager] linkItemAtPath:srcPath toPath:dstPath error:error];
}

+ (BOOL)removeItemAtPath:(NSString *)path error:(NSError **)error {
    return [[NSFileManager defaultManager] removeItemAtPath:path error:error];
}

+ (BOOL)copyItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError **)error {
    return [[NSFileManager defaultManager] copyItemAtURL:srcURL toURL:dstURL error:error];
}

+ (BOOL)moveItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError **)error {
    return [[NSFileManager defaultManager] moveItemAtURL:srcURL toURL:dstURL error:error];
}

+ (BOOL)linkItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError **)error {
    return [[NSFileManager defaultManager] linkItemAtURL:srcURL toURL:dstURL error:error];
}

+ (BOOL)removeItemAtURL:(NSURL *)URL error:(NSError **)error {
    return [[NSFileManager defaultManager] removeItemAtURL:URL error:error];
}


+ (NSString *)currentDirectoryPath {
    return [NSFileManager defaultManager].currentDirectoryPath;
}
+ (BOOL)changeCurrentDirectoryPath:(NSString *)path {
   return [[NSFileManager defaultManager] changeCurrentDirectoryPath:path];
}

+ (BOOL)fileExistsAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+ (BOOL)fileExistsAtPath:(NSString *)path isDirectory:(nullable BOOL *)isDirectory {
    return [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:isDirectory];
}

+ (BOOL)isReadableFileAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] isReadableFileAtPath:path];
}

+ (BOOL)isWritableFileAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] isWritableFileAtPath:path];
}

+ (BOOL)isExecutableFileAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] isExecutableFileAtPath:path];
}

+ (BOOL)isDeletableFileAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] isDeletableFileAtPath:path];
}

+ (NSString *)displayNameAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] displayNameAtPath:path];
}

+ (nullable NSArray<NSString *> *)componentsToDisplayForPath:(NSString *)path {
    return [[NSFileManager defaultManager] componentsToDisplayForPath:path];
}

+ (nullable NSDirectoryEnumerator<NSString *> *)enumeratorAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] enumeratorAtPath:path];
}


+ (nullable NSDirectoryEnumerator<NSURL *> *)enumeratorAtURL:(NSURL *)url includingPropertiesForKeys:(nullable NSArray<NSURLResourceKey> *)keys options:(NSDirectoryEnumerationOptions)mask errorHandler:(nullable BOOL (^)(NSURL *url, NSError *error))handler {
    return [[NSFileManager defaultManager] enumeratorAtURL:url includingPropertiesForKeys:keys options:mask errorHandler:handler];
}

+ (nullable NSArray<NSString *> *)subpathsAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] subpathsAtPath:path];
}

+ (nullable NSData *)contentsAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] contentsAtPath:path];
}
+ (BOOL)createFileAtPath:(NSString *)path contents:(nullable NSData *)data attributes:(nullable NSDictionary<NSFileAttributeKey, id> *)attr {
    return [NSFileManager createFileAtPath:path contents:data attributes:attr];
}
@end
