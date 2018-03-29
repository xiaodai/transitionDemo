//
//  Animater3.m
//  transitionDemo
//
//  Created by yangaichun on 2018/3/29.
//  Copyright © 2018年 yangaichun. All rights reserved.
//

#import "Animater3.h"

@interface Animater3()
@property (assign,nonatomic)BOOL isPresentAnimater;
@end


@implementation Animater3

+ (instancetype)presentAnimater;{
    Animater3 *animater = [Animater3 new];
    if (animater) {
        animater.isPresentAnimater = YES;
    }
    return animater;
}

+ (instancetype)dismissAnimater;{
    Animater3 *animater = [Animater3 new];
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
    CGRect frame = [transitionContext initialFrameForViewController:fromViewController];
    CGRect offScreenFrame = frame;
    offScreenFrame.origin.y = offScreenFrame.size.height;
    toView.frame = offScreenFrame;
    [contanview insertSubview:toView aboveSubview:fromView];
    
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0/-1000;
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    t1 = CATransform3DRotate(t1, 15.0*M_PI/180.0, 1, 0, 0);
    
    CATransform3D t2 = CATransform3DIdentity;
    t2.m34 = 1.0/-10000;
    t2 = CATransform3DTranslate(t2, 0, -fromView.frame.size.height*0.08, 0);
    t2 = CATransform3DScale(t2, 0.8, 0.8, 1);
    
    [UIView animateKeyframesWithDuration:1.0 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        //开始时间：1.0*0.0 持续时间：1.0*0.4
        [UIView addKeyframeWithRelativeStartTime:0.0f relativeDuration:0.4f animations:^{
            //执行t1动画 缩放并旋转角度
            fromView.layer.transform = t1;
            //fromView的透明度
            fromView.alpha = 0.6;
        }];
        //开始时间：1.0*0.1 持续时间：1.0*0.5
        [UIView addKeyframeWithRelativeStartTime:0.1f relativeDuration:0.5f animations:^{
            //执行t2动画 向上平移和缩放
            fromView.layer.transform = t2;
        }];
        //开始时间：1.0*0.0 持续时间：1.0*1.0
        [UIView addKeyframeWithRelativeStartTime:0.0f relativeDuration:1.0f animations:^{
            //toView向上滑入
            toView.frame = frame;
        }];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

- (void)dismissTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView *contanview = [transitionContext containerView];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromViewController.view;
    UIView *toView = toViewController.view;
    
    CGRect frame = [transitionContext initialFrameForViewController:fromViewController];
    toView.frame = frame;
    
    CGRect frameOffScreen = frame;
    frameOffScreen.origin.y = frame.size.height;
    
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0/-1000;
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    t1 = CATransform3DRotate(t1, 15.0f * M_PI/180.0f, 1, 0, 0);
    
    //关键帧过渡动画
    [UIView animateKeyframesWithDuration:1.0 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.0f relativeDuration:1.0f animations:^{
            //滑出屏幕
            fromView.frame = frameOffScreen;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.35f relativeDuration:0.35f animations:^{
            //执行t1,沿着x,y放大，沿x旋转
            toView.layer.transform = t1;
            //透明度变为1.0
            toView.alpha = 1.0;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.75f relativeDuration:0.25f animations:^{
            //还原3D状态
            toView.layer.transform = CATransform3DIdentity;
        }];
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
