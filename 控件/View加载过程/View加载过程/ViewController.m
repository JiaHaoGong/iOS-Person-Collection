//
//  ViewController.m
//  View加载过程
//
//  Created by ylgwhyh on 16/2/23.
//  Copyright © 2016年 com.hyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//可以在这里面动态修改界面的frame等等
- (void)viewWillLayoutSubviews{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
