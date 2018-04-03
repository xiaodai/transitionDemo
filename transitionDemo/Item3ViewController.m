//
//  Item3ViewController.m
//  transitionDemo
//
//  Created by yangaichun on 2018/3/30.
//  Copyright © 2018年 yangaichun. All rights reserved.
//

#import "Item3ViewController.h"
#import "InteractiveTranViewController.h"


@interface Item3ViewController ()
@property (strong,nonatomic) InteractiveTranViewController *vc;
@end

@implementation Item3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panChange:)];
    [self.view addGestureRecognizer:panGesture];
}

-(void)panChange:(UIPanGestureRecognizer *)recognizer{
    UIView * view = self.view;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint translation = [recognizer translationInView:view];
        if (translation.x<0) {
            if(!self.vc){
                self.vc = [InteractiveTranViewController new];
                self.vc.transitioningDelegate = self.vc;
                self.vc.modalPresentationStyle = UIModalPresentationCustom;
            }
            [self.tabBarController presentViewController:self.vc animated:YES completion:nil];
        }else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }else if (recognizer.state == UIGestureRecognizerStateChanged){
        CGPoint translation = [recognizer translationInView:view];
        CGFloat distance = translation.x/CGRectGetWidth(view.bounds);
        if (distance > 0) {
            [self.vc.interactionController updateInteractiveTransition:distance];
        }
    }else if (recognizer.state == UIGestureRecognizerStateEnded){
        CGPoint translation = [recognizer translationInView:view];
        CGFloat distance = fabs(translation.x/CGRectGetWidth(view.bounds));
        
        if (distance > 0.2) {
            [self.vc.interactionController finishInteractiveTransition];
        }else{
            [self.vc.interactionController cancelInteractiveTransition];
        }
        //       self.interactionController一定要设置为nil，否则你可能在你不想返回的时候返回一个interactionController
        self.vc.interactionController = nil;
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
