//
//  ViewController.m
//  transitionDemo
//
//  Created by yangaichun on 2018/3/28.
//  Copyright © 2018年 yangaichun. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showVC2:(id)sender {
    TwoViewController *vc2 = [TwoViewController new];
    [self presentViewController:vc2 animated:YES completion:nil];
}

- (IBAction)showThreeVC:(id)sender {
    ThreeViewController *vc3 = [ThreeViewController new];
    [self presentViewController:vc3 animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
