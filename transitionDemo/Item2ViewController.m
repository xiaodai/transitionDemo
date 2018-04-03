//
//  Item2ViewController.m
//  transitionDemo
//
//  Created by yangaichun on 2018/3/30.
//  Copyright © 2018年 yangaichun. All rights reserved.
//

#import "Item2ViewController.h"
#import "PushedViewController.h"
#import "NavAnimater.h"

@interface Item2ViewController ()<UINavigationControllerDelegate>

@end

@implementation Item2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.navigationController.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}



- (IBAction)pushTouched:(id)sender {
    PushedViewController *vc = [PushedViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC;{
    if(operation == UINavigationControllerOperationPush){
        return  [NavAnimater pushAnimater];
    }else if(operation == UINavigationControllerOperationPop){
        return [NavAnimater popAnimater];
    }else{
        return nil;
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
