//
//  InteractiveTranViewController.m
//  transitionDemo
//
//  Created by yangaichun on 2018/3/30.
//  Copyright © 2018年 yangaichun. All rights reserved.
//

#import "InteractiveTranViewController.h"
#import "InteractionAnimater.h"

@interface InteractiveTranViewController ()

@end

@implementation InteractiveTranViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panChange:)];
    //[self.view addGestureRecognizer:panGesture];
}


//-(void)panChange:(UIPanGestureRecognizer *)recognizer{
//    UIView * view = self.view;
//    if (recognizer.state == UIGestureRecognizerStateBegan) {
//        CGPoint translation = [recognizer translationInView:view];
//        if (translation.x>0) {
//            [self dismissViewControllerAnimated:YES completion:nil];
//        }
//    }else if (recognizer.state == UIGestureRecognizerStateChanged){
//        CGPoint translation = [recognizer translationInView:view];
//        CGFloat distance = translation.x/CGRectGetWidth(view.bounds);
//        if (distance > 0) {
//            [self.interactionController updateInteractiveTransition:distance];
//        }
//    }else if (recognizer.state == UIGestureRecognizerStateEnded){
//        CGPoint translation = [recognizer translationInView:view];
//        CGFloat distance = fabs(translation.x/CGRectGetWidth(view.bounds));
//        
//        if (distance > 0.5) {
//            [self.interactionController finishInteractiveTransition];
//        }else{
//            [self.interactionController cancelInteractiveTransition];
//        }
//        //       self.interactionController一定要设置为nil，否则你可能在你不想返回的时候返回一个interactionController
//        self.interactionController = nil;
//    }
//}



- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;{
    return [InteractionAnimater presentAnimater];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed;{
    return [InteractionAnimater dismissAnimater];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator;{
    return self.interactionController;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator;{
    return self.interactionController;
}



-(UIPercentDrivenInteractiveTransition *)interactionController{
    if (!_interactionController) {
        _interactionController = [[UIPercentDrivenInteractiveTransition alloc]init];
    }
    return _interactionController;
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
