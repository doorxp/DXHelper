//
//  NSFetchedResultsController+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/19.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSFetchedResultsController (DXHelper)
+ (nullable instancetype)fetchRequest:(nullable NSFetchRequest *)fetchRequest managedObjectContext: (nullable NSManagedObjectContext *)context sectionNameKeyPath:(nullable NSString *)sectionNameKeyPath cacheName:(nullable NSString *)name;
@end

@compatibility_alias NSFetcher NSFetchedResultsController;
