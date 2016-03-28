//
//  ViewController.m
//  testBlockMemory
//
//  Created by ylgwhyh on 16/3/28.
//  Copyright © 2016年 com.ylgwhyh.testBlockMemory. All rights reserved.
//

#import "ViewController.h"
#import "BlockAlert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    __block BlockAlert *alert = [[BlockAlert alloc] initWithTitle:@"您是否要退出本次注册" message:@"" cancelButtonTitle:@"确定" otherButtonTitles:@"取消" block:^(NSInteger buttonIndex) {
        [alert dismissWithClickedButtonIndex:0 animated:NO];
    }];
    [alert show];
                         
        
                         
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
