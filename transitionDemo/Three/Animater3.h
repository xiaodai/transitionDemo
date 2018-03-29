//
//  Animater3.h
//  transitionDemo
//
//  Created by yangaichun on 2018/3/29.
//  Copyright © 2018年 yangaichun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animater3 : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)presentAnimater;
+ (instancetype)dismissAnimater;

@end
