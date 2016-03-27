//
//  ViewController.m
//  testNotificationDemo
//
//  Created by ylgwhyh on 16/3/10.
//  Copyright © 2016年 com.hyh. All rights reserved.
//

#import "ViewController.h"
#import "YLNotificationName.h"


@interface ViewController ()

- (IBAction)notificationBtnOne:(id)sender;

- (IBAction)notificationBtnTwo:(id)sender;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    //这里需要注意到 ： 通知只能是 对象才可用，且该对象必须存在于内存中
    //1、获得通知中心对象
    //2、监听通知
    //【center addObserver :监听者 selector：须执行的方法 name：被监听通知的名称 object：通知发送者】;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(testNotificationOne:) name:YLTestNotificationOne object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testNotificationTwo:) name:YLTestNotificationTwo object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)notificationBtnOne:(id)sender {
    
    //3、通知中心发布消息
    [[NSNotificationCenter defaultCenter] postNotificationName:YLTestNotificationOne object:nil];
}

- (IBAction)notificationBtnTwo:(id)sender {
    //3、通知中心发布消息
    [[NSNotificationCenter defaultCenter] postNotificationName:YLTestNotificationTwo object:nil];
}

- (void) testNotificationOne:(NSNotification *)notification{
    NSLog(@"testNotificationOne");
}

- (void) testNotificationTwo:(NSNotification *)notification{
    NSLog(@"testNotificationTwo");
}


- (void)dealloc{
    
     // 将当前对象监听的所有通知移除
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    // 移除指定name关联的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:YLTestNotificationOne object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:YLTestNotificationTwo object:nil];
}
@end
