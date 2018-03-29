//
//  Animater.h
//  transitionDemo
//
//  Created by yangaichun on 2018/3/28.
//  Copyright © 2018年 yangaichun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animater : NSObject<UIViewControllerAnimatedTransitioning>


+ (instancetype)presentAnimater;
+ (instancetype)dismissAnimater;

@end
