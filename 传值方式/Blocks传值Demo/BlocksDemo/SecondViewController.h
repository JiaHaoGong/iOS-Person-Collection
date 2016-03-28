//
//  SecondViewController.h
//  BlocksDemo
//
//  Created by zhangxiao on 13-12-30.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (nonatomic, copy) void (^backValue)(NSString *strValue);
@property (nonatomic, retain) UITextField *text;

@end
