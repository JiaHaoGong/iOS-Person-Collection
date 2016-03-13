//
//  ViewController.m
//  storyBoardTraditionalValues(传值)
//
//  Created by ylgwhyh on 16/3/13.
//  Copyright © 2016年 com.hyh. All rights reserved.
//

#import "ViewController.h"
#import "OneVC.h"
#import "TwoVC.h"


@interface ViewController ()

- (IBAction)pushOne:(id)sender;

- (IBAction)pushTwo:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushOne:(id)sender {
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    // segue.identifier：获取连线的ID
    if ([segue.identifier isEqualToString:@"pushOneID"]) {
        // segue.destinationViewController：获取连线时所指的界面（VC）
        OneVC *receive = segue.destinationViewController;
        receive.name = @"OneVC";
        receive.age = 110;
        // 这里不需要指定跳转了，因为在按扭的事件里已经有跳转的代码
        //        [self.navigationController pushViewController:receive animated:YES];
    }else if ([segue.identifier isEqualToString:@"pushTwoID"]) {
        // segue.destinationViewController：获取连线时所指的界面（VC）
        TwoVC *receive = segue.destinationViewController;
        receive.name = @"TwoVC";
        receive.age = 220;
    }
}

- (IBAction)pushTwo:(id)sender {
}
@end
