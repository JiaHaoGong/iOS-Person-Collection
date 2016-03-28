//
//  WViewController.m
//  DelegateByValue
//
//  Created by wzrong on 13-7-20.
//  Copyright (c) 2013年 wzrong. All rights reserved.
//

#import "WViewController.h"

@interface WViewController ()

@end

@implementation WViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLblValue:nil];
    [super viewDidUnload];
}

/**
 “施法”按钮事件，用来处理点击“施法”按钮后的事情。
 此事例中要来调用弹出 WTwoViewController
 */
- (IBAction)pressCasting:(id)sender {
    // 给 WTwoViewController 分配内存，并初始化xib文件
    WTwoViewController *controller = [[WTwoViewController alloc]initWithNibName:@"WTwoViewController" bundle:nil];
    
    // 设置代理到此Controller
    controller.delegate = self;
    
    // 弹出 WTwoViewController
    [self presentViewController:controller animated:YES completion:nil];
}

/**
 此方为必须实现的协议方法，用来传值
 */
- (void)changeValue:(NSString *)value{
    // 改变UILabel的值
    self.lblValue.text = value;
}

@end
