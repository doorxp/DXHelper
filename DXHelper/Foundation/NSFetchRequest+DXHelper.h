//
//  NSFetchRequest+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/19.
//  Copyright © 2017年 doorxp. All rights reserved.
//

@import CoreData;

typedef NSFetchRequest *(^DXSorter)(NSString *name);
typedef NSFetchRequest *(^DXFilter)(NSString *format, ...);
typedef NSFetchRequest *(^DXFetchRequestValue)(NSUInteger value);

typedef NSFetchRequest *(^DXFilterOperation)(void);
typedef void (^DXFetchRequestEnd)(void);



@interface NSFetchRequest (DXHelper)
@property (nonatomic, readonly)DXSorter asc;
@property (nonatomic, readonly)DXSorter desc;

@property (nonatomic, readonly)DXFilter filter;

#ifndef __cplusplus
@property (nonatomic, readonly)DXFilterOperation and;
@property (nonatomic, readonly)DXFilterOperation or;
@property (nonatomic, readonly)DXFilterOperation not;
#endif

@property (nonatomic, readonly)DXFetchRequestValue offset;
@property (nonatomic, readonly)DXFetchRequestValue batchSize;
@property (nonatomic, readonly)DXFetchRequestValue limit;

@property (nonatomic, readonly)DXFetchRequestEnd end;

@end
