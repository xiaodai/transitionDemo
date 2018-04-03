//
//  InteractiveTranViewController.h
//  transitionDemo
//
//  Created by yangaichun on 2018/3/30.
//  Copyright © 2018年 yangaichun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InteractiveTranViewController : UIViewController<UIViewControllerTransitioningDelegate>
@property (strong,nonatomic)UIPercentDrivenInteractiveTransition *interactionController;
@end
