//
//  NSFetchRequest+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/19.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "NSFetchRequest+DXHelper.h"
#import <objc/runtime.h>

@implementation NSFetchRequest (DXHelper)
@dynamic asc;
@dynamic desc;

@dynamic filter;
@dynamic and;
@dynamic or;
@dynamic not;

@dynamic offset;
@dynamic limit;
@dynamic batchSize;

@dynamic end;


@end


@interface NSFetchRequest(sorter)

@property (nonatomic, strong, readonly)NSMutableArray *arrSorter;

@end

const char *filterKey = "arrFilters";
const char *sorterKey = "arrSorter";

@implementation NSFetchRequest(sorter)

- (NSMutableArray *)arrSorter {
    
    NSMutableArray *arr = objc_getAssociatedObject(self, sorterKey);
    if (!arr) {
        arr = [NSMutableArray array];
        objc_setAssociatedObject(self, sorterKey, arr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return arr;
}

- (DXSorter)asc {
    __weak typeof(self) SELF = self;
    return ^(NSString *name) {
        
        [SELF.arrSorter addObject:[NSSortDescriptor sortDescriptorWithKey:name ascending:true]];
        
        return SELF;
    };
}

- (DXSorter)desc {
    __weak typeof(self) SELF = self;
    return ^(NSString *name) {
        
        [SELF.arrSorter addObject:[NSSortDescriptor sortDescriptorWithKey:name ascending:false]];
        
        return SELF;
    };
}

- (DXFetchRequestValue)offset {
    __weak typeof(self) SELF = self;
    return ^(NSUInteger value) {
        SELF.fetchOffset = value;
        return SELF;
    };
}

- (DXFetchRequestValue)batchSize {
    __weak typeof(self) SELF = self;
    return ^(NSUInteger value) {
        SELF.fetchBatchSize = value;
        return SELF;
    };
}

- (DXFetchRequestValue)limit {
    __weak typeof(self) SELF = self;
    return ^(NSUInteger value) {
        SELF.fetchLimit = value;
        return SELF;
    };
}


@end

@interface NSFetchRequest(filter)
@property (nonatomic, strong, readonly)NSMutableArray *arrFilters;
@end

@implementation NSFetchRequest(filter)
- (NSMutableArray *)arrFilters {
    
    
    NSMutableArray *arr = objc_getAssociatedObject(self, filterKey);
    if (!arr) {
        arr = [NSMutableArray array];
        objc_setAssociatedObject(self, filterKey, arr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return arr;
}

- (DXFilter)filter {
    __weak typeof(self) SELF = self;
    return ^(NSString *format, ...) {
        
        va_list ap;
        va_start(ap, format);
        NSPredicate *predicate = [NSPredicate predicateWithFormat:format arguments:ap];
        va_end(ap);
        
        [SELF.arrFilters addObject:predicate];
        
        return SELF;
    };
}

- (DXFilterOperation) and {
    __weak typeof(self) SELF = self;
    
    NSPredicate *predicate = self.arrFilters.firstObject;
    if (self.arrFilters.count > 1) {
        predicate = [NSCompoundPredicate andPredicateWithSubpredicates:self.arrFilters];
    }
    
    [self.arrFilters removeAllObjects];
    [self.arrFilters addObject:predicate];
    
    return ^{
        return SELF;
    };
}

- (DXFilterOperation) or {
    __weak typeof(self) SELF = self;
    
    NSPredicate *predicate = self.arrFilters.firstObject;
    if (self.arrFilters.count > 1) {
        predicate = [NSCompoundPredicate orPredicateWithSubpredicates:self.arrFilters];
    }
    
    [self.arrFilters removeAllObjects];
    [self.arrFilters addObject:predicate];
    
    return ^{
        return SELF;
    };
}

- (DXFilterOperation) not {
    __weak typeof(self) SELF = self;
    
    NSPredicate *predicate = self.arrFilters.lastObject;
    if (!!predicate) {
        predicate = [NSCompoundPredicate notPredicateWithSubpredicate:predicate];
        [self.arrFilters replaceObjectAtIndex:self.arrFilters.count-1 withObject:predicate];
    }
    
    return ^{
        return SELF;
    };
}

- (DXFetchRequestEnd)end {
    self.predicate = self.arrFilters.firstObject;
    self.sortDescriptors = self.arrSorter;
    
    objc_setAssociatedObject(self, filterKey, nil, OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self, sorterKey, nil, OBJC_ASSOCIATION_RETAIN);
    
    return ^{
        
    };
}

@end
