//
//  CModalViewController.m
//  ModelView
//
//  Created by caorui on 8/30/14.
//  Copyright (c) 2014 com.MySuperCompany. All rights reserved.
//

#import "CModalViewController.h"

@interface CModalViewController ()

@end

@implementation CModalViewController

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
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(320/2-140/2, 80, 140, 40)];
    [self.view addSubview: _textField];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    [ _textField release];
    
    self.view.backgroundColor = [UIColor purpleColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor =  [UIColor whiteColor];
    [button setFrame:CGRectMake(320/2-140/2, 140, 140, 40)];
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)dismiss
{
    // 改变label的内容(发送通知)
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLabelTextNotification" object:_textField.text];
    
    if([[UIDevice currentDevice].systemVersion floatValue] < 6.0){
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }else{
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
