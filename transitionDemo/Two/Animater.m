//
//  Animater.m
//  transitionDemo
//
//  Created by yangaichun on 2018/3/28.
//  Copyright © 2018年 yangaichun. All rights reserved.
//

#import "Animater.h"

@interface Animater()
@property (assign,nonatomic)BOOL isPresentAnimater;
@end


@implementation Animater

+ (instancetype)presentAnimater;{
    Animater *animater = [Animater new];
    if (animater) {
        animater.isPresentAnimater = YES;
    }
    return animater;
}

+ (instancetype)dismissAnimater;{
    Animater *animater = [Animater new];
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
    UIButton *addbutton = [fromViewController.view viewWithTag:100];
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [contanview addSubview:presentedView];//要执行动画的view必须在containerView中
    presentedView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    UIBezierPath *maskInitPatch = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(addbutton.center.x, addbutton.center.y, 0, 0)];
    CGRect finalRect = CGRectInset(contanview.bounds, -1000, -1000);
    UIBezierPath *maskFinalPatch = [UIBezierPath bezierPathWithOvalInRect:finalRect];
    //用 CAShapeLayer 作为 mask
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.path = maskFinalPatch.CGPath;
    presentedView.layer.mask = maskLayer;
    //对 CAShapeLayer 的 path 属性进行动画
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue =(__bridge id _Nullable)([maskInitPatch CGPath]);
    maskLayerAnimation.toValue = (__bridge id _Nullable)([maskFinalPatch CGPath]);
    maskLayerAnimation.duration = [self transitionDuration:transitionContext];
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
    [transitionContext completeTransition:YES];
}

- (void)dismissTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView *contanview = [transitionContext containerView];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromview = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIButton *addbutton = [toViewController.view viewWithTag:100];
    CGRect initRect = CGRectInset(contanview.bounds, -1000, -1000);
    UIBezierPath *maskInitPatch =  [UIBezierPath bezierPathWithOvalInRect:initRect];
    UIBezierPath *maskFinalPatch = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(addbutton.center.x, addbutton.center.y, 0, 0)];
    //用 CAShapeLayer 作为 mask
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.path = maskFinalPatch.CGPath;
    fromview.layer.mask = maskLayer;
    //对 CAShapeLayer 的 path 属性进行动画
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue =(__bridge id _Nullable)([maskInitPatch CGPath]);
    maskLayerAnimation.toValue = (__bridge id _Nullable)([maskFinalPatch CGPath]);
    maskLayerAnimation.duration = [self transitionDuration:transitionContext];
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([self transitionDuration:transitionContext] * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //custom 模式下，presentingview 没移除，此方法必要延迟调用，否则动画还没执行，presentingview（toview）就显示出来了，看不到动画效果
        [transitionContext completeTransition:YES];
    });
}







@end
