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

    {
        SZButton *btn = [SZButton buttonWithType:UIButtonTypeCustom];
        btn.layoutImageTitleVertical = NO;
        btn.paddingBetweenImageAndTitle = 20;
        [btn setTitle:@"特斯特天赋" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"菜单栏-购物车"] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor lightGrayColor];
        [btn sizeToFit];
        btn.frame = CGRectMake(0, 0, 205, 79);
        btn.center = CGPointMake(200, 100);
        [self.view addSubview:btn];
    }

    {
        SZButton *btn = [SZButton buttonWithType:UIButtonTypeCustom];
        btn.layoutImageTitleVertical = YES;
        btn.paddingBetweenImageAndTitle = 20;
        [btn setTitle:@"特斯特天赋" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"菜单栏-购物车"] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor lightGrayColor];
        [btn sizeToFit];
        btn.frame = CGRectMake(0, 0, 205, 79);
        btn.center = CGPointMake(200, 200);
        [self.view addSubview:btn];
    }

    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"特斯特天赋" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"菜单栏-购物车"] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor lightGrayColor];
        [btn sizeToFit];
        btn.frame = CGRectMake(0, 0, 205, 79);
        btn.center = CGPointMake(200, 300);
        [self.view addSubview:btn];
    }

    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"特斯特天赋" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor lightGrayColor];
        [btn sizeToFit];
        btn.frame = CGRectMake(0, 0, 205, 79);
        btn.center = CGPointMake(200, 400);
        [self.view addSubview:btn];
    }

    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"菜单栏-购物车"] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor lightGrayColor];
        [btn sizeToFit];
        btn.frame = CGRectMake(0, 0, 205, 79);
        btn.center = CGPointMake(200, 500);
        [self.view addSubview:btn];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
