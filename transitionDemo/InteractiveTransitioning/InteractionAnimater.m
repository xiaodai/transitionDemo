//
//  InteractionAnimater.m
//  transitionDemo
//
//  Created by yangaichun on 2018/3/30.
//  Copyright © 2018年 yangaichun. All rights reserved.
//

#import "InteractionAnimater.h"

@interface InteractionAnimater()
@property (assign,nonatomic)BOOL isPresentAnimater;
@end

@implementation InteractionAnimater


+ (instancetype)presentAnimater;{
    InteractionAnimater *animater = [InteractionAnimater new];
    if (animater) {
        animater.isPresentAnimater = YES;
    }
    return animater;
}
+ (instancetype)dismissAnimater;{
    InteractionAnimater *animater = [InteractionAnimater new];
    if (animater) {
        animater.isPresentAnimater = NO;
    }
    return animater;
}


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext;{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext;{
    if (self.isPresentAnimater) {
        [self presentTransition:transitionContext];
    }else{
        [self dismissTransition:transitionContext];
    }
}

- (void)presentTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView *contanview = [transitionContext containerView];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromViewController.view;
    UIView *toView = toViewController.view;
    [contanview addSubview:fromView];
    [contanview addSubview:toView];//要执行动画的view必须在containerView中
    toView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        fromView.frame = CGRectMake(-[UIScreen mainScreen].bounds.size.width/2, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
         [transitionContext completeTransition:YES];
    }];
}

- (void)dismissTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView *contanview = [transitionContext containerView];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromViewController.view;
    UIView *toView = toViewController.view;
    [contanview addSubview:toView];
    [contanview addSubview:fromView];//要执行动画的view必须在containerView中
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        toView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}


@end
