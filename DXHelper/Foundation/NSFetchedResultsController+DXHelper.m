//
//  NSFetchedResultsController+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/19.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "NSFetchedResultsController+DXHelper.h"

@implementation NSFetchedResultsController (DXHelper)
+ (nullable instancetype)fetchRequest:(nullable NSFetchRequest *)fetchRequest managedObjectContext: (nullable NSManagedObjectContext *)context sectionNameKeyPath:(nullable NSString *)sectionNameKeyPath cacheName:(nullable NSString *)name {
    return [[self alloc] initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:sectionNameKeyPath cacheName:name];
}
@end
