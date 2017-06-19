//
//  UIViewController+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "UIViewController+DXHelper.h"

@implementation UIViewController (DXHelper)
- (__kindof UIViewController *)xib:(NSString *)nameInStoryboard {
    if ([nameInStoryboard length] > 0) {
        return [self.storyboard instantiateViewControllerWithIdentifier:nameInStoryboard];
    }
    else {
        return [self.storyboard instantiateInitialViewController];
    }
}

- (void)pushViewController:(UIViewController *_Nullable)viewController animated:(BOOL)animated {
    [self.navigationController pushViewController:viewController animated:animated];
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated {
    return [self.navigationController popViewControllerAnimated:animated];
}

- (void)reloadData {
    if ([self respondsToSelector:@selector(tableView)]) {
        [[(id)self tableView] reloadData];
    }
    else if ([self respondsToSelector:@selector(collectionView)]) {
        [[(id)self collectionView] reloadData];
    }
}

- (void)updateData {
}
@end
