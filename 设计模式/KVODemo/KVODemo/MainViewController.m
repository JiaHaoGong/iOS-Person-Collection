//
//  MainViewController.m
//  KVODemo
//
//  Created by Jack on 14-7-25.
//  Copyright (c) 2014年 jack. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize music;

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
    music = [[Music alloc] init];
    
    // 添加观察者  注册当属性发生改变的时候被调用的
    [music addObserver:self forKeyPath:@"musicName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    // UILabel控件
    UILabel *musicLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, 280, 21)];
    musicLabel.font = [UIFont fontWithName:@"ArialMT" size:18];
    musicLabel.textColor = [UIColor redColor];
    musicLabel.tag = 100;
    [self.view addSubview:musicLabel];
    
    
    // UITextField控件
    UITextField *musicTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 200, 280, 21)];
    musicTextField.font = [UIFont fontWithName:@"ArialMT" size:18];
    musicTextField.placeholder = @"Please enter some words.";
    musicTextField.backgroundColor = [UIColor whiteColor];
    
    // UITextField输入内容时候调用
    [musicTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [self.view addSubview:musicTextField];
    
    
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)textFieldDidChange:(id)sender {
    UITextField *textField = (UITextField *)sender;
    NSLog(@">>>>>>>>>>>>>>>%@",textField.text);
    // 修改正在监听的属性，将调用下面回调方法
    [music setValue:textField.text forKey:@"musicName"];
}

#pragma mark KVO自动调用的方法
// 只要Music类的"musicName"属性发生的变化都会触发到以下的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    UILabel *label = (UILabel *)[self.view viewWithTag:100];
    // 如果改变的属性是"musicName"
    if ([keyPath isEqualToString:@"musicName"]) {
        // 将 当前的musicName属性的值 赋值给UILabel
        label.text = [music valueForKey:@"musicName"];
        // 输出改变前的值
        NSLog(@"old musicName is %@",[change objectForKey:@"old"]);
        // 输出改变后的值
        NSLog(@"new musicName is %@",[change objectForKey:@"new"]);
    }
}

#pragma mark - Memory Management
- (void)dealloc {
    // 移除观察者
    [music removeObserver:self forKeyPath:@"musicName"];
    
  
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
