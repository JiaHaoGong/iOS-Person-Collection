//
//  NotificationTwoVC.m
//  testNotificationDemo
//
//  Created by ylgwhyh on 16/3/22.
//  Copyright © 2016年 com.hyh. All rights reserved.
//

#import "NotificationTwoVC.h"
#import "YLNotificationName.h"


@implementation NotificationTwoVC
- (IBAction)testNotificationBtn:(id)sender {
    
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:YLTestNotificationTwo object:nil];
}

@end
