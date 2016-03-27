//
//  SBTMainVC.m
//  storyBoardTraditionalValues(传值)
//
//  Created by ylgwhyh on 16/3/15.
//  Copyright © 2016年 com.hyh. All rights reserved.
//

#import "SBTMainVC.h"

@interface SBTMainVC ()

@end

@implementation SBTMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
     NSLog(@"name is %@, age is %d", _name, _age);
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
