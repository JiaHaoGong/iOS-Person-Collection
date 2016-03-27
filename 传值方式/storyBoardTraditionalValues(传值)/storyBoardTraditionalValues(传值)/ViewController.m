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
#import "SBTMainVC.h"
#import "FiveVC.h"

@interface ViewController ()

- (IBAction)pushOne:(id)sender;

- (IBAction)pushTwo:(id)sender;

- (IBAction)pushFour:(id)sender;

- (IBAction)pushFive:(id)sender;

- (IBAction)pushSix:(id)sender;

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

//storyBoard传值
//1，storyBoard里跳转拖线：先点controller，与下一页面链接，并将线设一个identifier值
//2，在.m里通过[self performSegueWithIdentifier:ID sender:nil]实现跳转。
//3，如果需要传参，则可重写方法
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

// 仅仅连线，然后用代码跳转
// 根据指定线的ID跳转到目标Vc
- (IBAction)pushFour:(id)sender {
    [self performSegueWithIdentifier:@"pushFourID" sender:self];
}

- (IBAction)pushFive:(id)sender {
    FiveVC *next = [self.storyboard instantiateViewControllerWithIdentifier:@"FiveVCID"];
    [self.navigationController pushViewController:next animated:YES];
}

- (IBAction)pushSix:(id)sender {
    
    // 获取指定的Storyboard，name填写Storyboard的文件名
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Two" bundle:nil];
    // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
    SBTMainVC *next = [storyboard instantiateViewControllerWithIdentifier:@"SBTMainVCID"];

    next.name = @"SMTMainVC";
    next.age = 330;
    [self.navigationController pushViewController:next animated:YES];
}
@end
