//
//  UIScrollView+PullToLoad.m
//  YLPullToLoadDemo
//
//  Created by Yong Li on 5/29/14.
//  Copyright (c) 2014 Yong Li. All rights reserved.
//

#import "UIScrollView+PullToLoad.h"
#import <objc/runtime.h>


static char UIScrollViewPullToLoadIndicator;

@implementation UIScrollView (PullToLoad)
@dynamic indicatorView;

- (UIRefreshControl *)indicatorView {
    return objc_getAssociatedObject(self, &UIScrollViewPullToLoadIndicator);
}

- (void)setIndicatorView:(UIRefreshControl *)indicatorView {
    if (indicatorView != self.indicatorView) {
        [self willChangeValueForKey:@"UIScrollViewPullToLoadIndicator"];
        objc_setAssociatedObject(self, &UIScrollViewPullToLoadIndicator, indicatorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self didChangeValueForKey:@"UIScrollViewPullToLoadIndicator"];
    }
}

- (void)setShowPullToLoadView {
    self.scrollEnabled = YES;
    self.alwaysBounceVertical = YES;
    if (!self.indicatorView) {
        UIRefreshControl* refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        refreshControl.frame = CGRectMake(0.5*(self.frame.size.width - refreshControl.bounds.size.width),
                                          (self.frame.size.width - refreshControl.bounds.size.height),
                                          refreshControl.bounds.size.width,
                                          refreshControl.bounds.size.height);
        [self addSubview:refreshControl];
        [self setIndicatorView:refreshControl];
    }
}

@end
