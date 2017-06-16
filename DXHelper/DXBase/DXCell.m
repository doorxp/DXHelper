//
//  DXCell.m
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "DXCell.h"

@interface DXCell()

@property (nonatomic, strong)id data;
@property (nonatomic, strong)id other;


@property (nonatomic, strong)IBOutlet UILabel *lblTitle;
@property (nonatomic, strong)IBOutlet UILabel *lblDesc;
@property (nonatomic, strong)IBOutlet UIImageView *imgView;

@end

@implementation DXCell

- (void)bind:(id)data0 other:(id)other {
    self.data = data0;
    self.other = other;
}

- (void)bind:(id)data0 {
    [self bind:data0 other:nil];
}


@end

@interface DXTableCell()
@property (nonatomic, strong)id data;
@property (nonatomic, strong)id other;


@property (nonatomic, strong)IBOutlet UILabel *lblTitle;
@property (nonatomic, strong)IBOutlet UILabel *lblDesc;
@property (nonatomic, strong)IBOutlet UIImageView *imgView;
@end

@implementation DXTableCell

- (void)bind:(id)data0 other:(id)other {
    self.data = data0;
    self.other = other;
}

- (void)bind:(id)data0 {
    [self bind:data0 other:nil];
}

@end


@interface DXCollectionCell()

@property (nonatomic, strong)id data;
@property (nonatomic, strong)id other;


@property (nonatomic, strong)IBOutlet UILabel *lblTitle;
@property (nonatomic, strong)IBOutlet UILabel *lblDesc;
@property (nonatomic, strong)IBOutlet UIImageView *imgView;

@end

@implementation DXCollectionCell

- (void)bind:(id)data0 other:(id)other {
    self.data = data0;
    self.other = other;
}

- (void)bind:(id)data0 {
    [self bind:data0 other:nil];
}

@end
