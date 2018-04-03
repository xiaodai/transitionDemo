//
//  NavAnimater.m
//  transitionDemo
//
//  Created by yangaichun on 2018/3/30.
//  Copyright © 2018年 yangaichun. All rights reserved.
//

#import "NavAnimater.h"
@interface NavAnimater()
@property (assign,nonatomic)BOOL isPush;
@end

@implementation NavAnimater

+ (instancetype)pushAnimater;{
    NavAnimater *animater = [NavAnimater new];
    if (animater) {
        animater.isPush = YES;
    }
    return animater;
}
+ (instancetype)popAnimater;{
    NavAnimater *animater = [NavAnimater new];
    if (animater) {
        animater.isPush = NO;
    }
    return animater;
}


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext;{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext;{
    if (self.isPush) {
        [self pushTransition:transitionContext];
    }else{
        [self popTransition:transitionContext];
    }
}

- (void)pushTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView *contanview = [transitionContext containerView];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    CGRect frame = [transitionContext initialFrameForViewController:fromViewController];
    CGRect offScreenFrame = frame;
    offScreenFrame.origin.y = offScreenFrame.size.height;
    toView.frame = offScreenFrame;
    [contanview addSubview:toView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
         toView.frame = frame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

- (void)popTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView *contanview = [transitionContext containerView];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromViewController.view;
    UIView *toView = toViewController.view;
    CGRect frame = [transitionContext initialFrameForViewController:fromViewController];
    CGRect offScreenFrame = frame;
    offScreenFrame.origin.y = offScreenFrame.size.height;
    //fromView.frame = offScreenFrame;
    [contanview insertSubview:toView belowSubview:fromView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.frame = offScreenFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}


@end
