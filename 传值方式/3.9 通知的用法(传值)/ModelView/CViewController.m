//
//  CViewController.m
//  ModelView
//
//  Created by caorui on 8/30/14.
//  Copyright (c) 2014 com.MySuperCompany. All rights reserved.
//

#import "CViewController.h"

@interface UIViewController ()

@end

@implementation CViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    ////添加弹出模态视图按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = [UIColor redColor];
    [button setFrame:CGRectMake(320/2-140/2, 200, 140, 40)];
    button.tag = 101;
    [button setTitle:@"Present" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPresent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(90, 100, 140, 40)];
    label.text = @"Hello World";
    label.tag = 102;
    label.textAlignment  = NSTextAlignmentCenter; //  居中
    
    [self.view addSubview:label];
    [label release];
    
    // 这里是通知，当设备方向改变时，就告诉我（调用“deviceOrientation：”这个方法）
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientation:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    // 我向通知中心注册了一条通知, 名字是：“changeLabelTextNotification”
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLabelText:) name:@"changeLabelTextNotification" object:nil];
}

-(void)buttonPresent
{
    CModalViewController * modalView = [[CModalViewController alloc]init];
//    modalView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] < 6.0){
        [self presentViewController:modalView animated:YES completion:^{
        }];
    }else{
        // [self presentModalViewController:modalView animated:YES];  ios 6 弃用了该方法
        [self presentViewController:modalView animated:YES completion:^{
            NSLog(@"call back");
        }];
    }
    [modalView release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 //设备方向检查（比如：横屏、竖屏等等）
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (void) deviceOrientation:(NSNotification *)notification
{
    //NSLog(@"userInfo : %@", [notification userInfo]);
    UIDevice *device = (UIDevice *)[notification object];
    NSLog(@"device : %ld",(long)device.orientation);
}

#pragma mark --Orientation
- (BOOL)shouldAutorotate
{
    return YES;
}
- (NSUInteger)supportedInterfaceOrientations
{
    return  UIInterfaceOrientationMaskAllButUpsideDown;
}


// iOS(3.0) 设备方向检查（比如：横屏、竖屏等等）在UIViewController类里面能找到相关的很多方法，只需要在子类中重写添加新功能即可
- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"duration : %f", duration);
    
    UIView *button = [self.view viewWithTag:101];
    if(toInterfaceOrientation == UIInterfaceOrientationPortrait)
    {
        button.frame = CGRectMake(320/2-140/2, 80, 140, 40);
    }else{
        button.frame = CGRectMake(480/2-140/2, 80, 140, 40);
    }
}

#pragma mark-
- (void)changeLabelText:(NSNotification *)notification
{
    id text = notification.object;
    UILabel *label = (UILabel *) [self.view viewWithTag:102];
    label.text = text;
}

- (void)dealloc
{
    // 移除消息中心
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kChangeLabelTextNotification object:nil];
    [super dealloc ];
}

@end
