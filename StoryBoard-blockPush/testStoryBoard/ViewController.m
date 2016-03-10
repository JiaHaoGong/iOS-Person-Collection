//
//  ViewController.m
//  testStoryBoard
//
//  Created by ylgwhyh on 16/3/9.
//  Copyright © 2016年 com.hyh. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "Test2VCOne.h"
#import "NavigationOneVC.h"

typedef void(^success)(NSString *str);

@interface ViewController ()
- (IBAction)testBlockPush:(id)sender;
- (IBAction)pushStoryBoardVC:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NavigationOneVC *nextNv = [[NavigationOneVC alloc] init];
    //[self.navigationController pushViewController:nextNv animated:YES]; //push到Navi是不行的
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)testBlack:(void(^)(int a))test{
    NSLog(@"ceshi");
    
    //这里跳转正常
    //[self push];

}

- (IBAction)testBlockPush:(id)sender {
    
    __weak typeof(self) weakSelf = self;
    [self testBlack:^(int a) {
        
        // block 回调里无法跳转
        [self push];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self push];
        });  //无用的
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self push]; //无用
        });
       
    }];
}

- (IBAction)pushStoryBoardVC:(id)sender {
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Test2" bundle:nil];
    Test2VCOne *nextViewController =[board instantiateViewControllerWithIdentifier:@"Test2VCOneID"];
    [self.navigationController pushViewController:nextViewController animated:YES];
}

- (void)push{
    OneViewController *next = [self.storyboard instantiateViewControllerWithIdentifier:@"OneViewControllerID"];
    [self.navigationController pushViewController:next animated:YES];
}
@end
