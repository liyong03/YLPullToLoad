//
//  UIScrollView+PullToLoad.h
//  YLPullToLoadDemo
//
//  Created by Yong Li on 5/29/14.
//  Copyright (c) 2014 Yong Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (PullToLoad)

@property (nonatomic, strong, readonly) UIRefreshControl* indicatorView;

- (void)setShowPullToLoadView;

@end
