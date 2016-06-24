//
//  ViewController.m
//  SZButtonDemo
//
//  Created by 陈圣治 on 16/6/24.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "ViewController.h"
#import "SZButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SZButton *btn = [[SZButton alloc] init];
    btn.text = @"是的发生的发生发生的";
    btn.image = [UIImage imageNamed:@"菜单栏-购物车"];
    btn.isContentVertical = YES;
    btn.isTitleBegin = YES;
    btn.normalBackgroundColor = [UIColor colorWithWhite:0.5 alpha:1];
    btn.highlightBackgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(tapHandler:) forControlEvents:UIControlEventTouchUpInside];
    
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1
                                                           constant:0]];
}

- (void)tapHandler:(id)sender {
    NSLog(@"%@", sender);
}

@end
