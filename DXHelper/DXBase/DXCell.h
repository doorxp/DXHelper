//
//  DXCell.h
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "DXHelper.h"

@import UIKit;

@protocol DXCell <NSObject>

@property (nonatomic, strong, readonly)id data;
@property (nonatomic, strong, readonly)id other;


@property (nonatomic, strong, readonly)IBOutlet UILabel *lblTitle;
@property (nonatomic, strong, readonly)IBOutlet UILabel *lblDesc;
@property (nonatomic, strong, readonly)IBOutlet UIImageView *imgView;

- (void)bind:(id)data0 other:(id)other;
- (void)bind:(id)data0;

@end

@interface DXCell : UIView <DXCell>

@end

@interface DXTableCell : UITableViewCell<DXCell>

@end

@interface DXCollectionCell : UICollectionViewCell<DXCell>

@end
