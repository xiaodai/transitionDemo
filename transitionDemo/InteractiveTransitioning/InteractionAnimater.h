//
//  InteractionAnimater.h
//  transitionDemo
//
//  Created by yangaichun on 2018/3/30.
//  Copyright © 2018年 yangaichun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface InteractionAnimater : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)presentAnimater;
+ (instancetype)dismissAnimater;

@end
