//
//  WViewController.h
//  DelegateByValue
//
//  Created by wzrong on 13-7-20.
//  Copyright (c) 2013年 wzrong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTwoViewController.h"

/**
 主 Controller，通过此 Controller 调用 WTwoViewController，然后把 WTwoViewController 传递过来的值赋给 UILabel
 此 Controller 实现了 WTwoViewControllerDelegate 这个协议
 */
@interface WViewController : UIViewController<WTwoViewControllerDelegate>

/**
 用来显示 Delegate 传过来的值
 */
@property (strong, nonatomic) IBOutlet UILabel *lblValue;

/**
 “施法”按钮事件，用来处理点击“施法”按钮后的事情。
 此事例中要来调用弹出 WTwoViewController
 */
- (IBAction)pressCasting:(id)sender;

@end
