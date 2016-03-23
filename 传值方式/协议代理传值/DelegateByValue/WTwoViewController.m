//
//  WTwoViewController.m
//  DelegateByValue
//
//  Created by wzrong on 13-7-20.
//  Copyright (c) 2013年 wzrong. All rights reserved.
//

#import "WTwoViewController.h"

@interface WTwoViewController ()

@end

@implementation WTwoViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTxtValue:nil];
    [super viewDidUnload];
}

/**
 “我变变变！” 按钮点击事件，用来处理按钮点击后的事情。
 此例中用来发送代理，并退出当前窗体
 */
- (IBAction)pressChange:(id)sender {
    // 发送代理，并把文本框中的值传过去
    [self.delegate changeValue:self.txtValue.text];
    
    // 退出当前窗口
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
