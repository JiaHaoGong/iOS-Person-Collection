//
//  SecondViewController.m
//  BlocksDemo
//
//  Created by zhangxiao on 13-12-30.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

@synthesize backValue;
@synthesize text;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    text = [[UITextField alloc] initWithFrame:CGRectMake(10, 70, 300, 40)];
    text.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:text];
    [text release];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10, 110, 60, 30);
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick
{
    self.backValue(self.text.text);
    [self.navigationController popViewControllerAnimated:YES];
}

@end
