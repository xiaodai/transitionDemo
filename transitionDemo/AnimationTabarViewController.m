//
//  AnimationViewController.m
//  transitionDemo
//
//  Created by yangaichun on 2018/3/30.
//  Copyright © 2018年 yangaichun. All rights reserved.
//

#import "AnimationTabbarViewController.h"
#import "tabbarAnimater.h"

@interface AnimationTabbarViewController ()<UITabBarControllerDelegate>

@end

@implementation AnimationTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
                     animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                                       toViewController:(UIViewController *)toVC;{
    return [tabbarAnimater animater];
}

- (IBAction)swipeLeft:(id)sender {
    if (self.selectedIndex<self.viewControllers.count-1) {
        self.selectedIndex++;
    }
}

- (IBAction)swipeRigth:(id)sender {
    if (self.selectedIndex>0) {
        self.selectedIndex--;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
