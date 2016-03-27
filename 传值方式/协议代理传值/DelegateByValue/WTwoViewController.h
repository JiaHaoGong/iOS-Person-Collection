//
//  WTwoViewController.h
//  DelegateByValue
//
//  Created by wzrong on 13-7-20.
//  Copyright (c) 2013年 wzrong. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 定义协议，用来实现传值代理
 */
@protocol WTwoViewControllerDelegate <NSObject>

/**
 此方法为必须实现的协议方法，用来传值(把值传给它的代理)
 */
- (void)changeValue:(NSString *)value;

@end

/**
 弹出来的Controller，需要从这个页面回传值到调用它的WViewController中
 */
@interface WTwoViewController : UIViewController

/**
 此处利用协议来定义代理
 */
@property (nonatomic, unsafe_unretained) id<WTwoViewControllerDelegate> delegate;

/**
 这个文本框中的值可以自己随意改变。
 当点击“我变变变！”按钮后，它里边的值会回传到调用它的WViewController中
 */
@property (nonatomic, strong) IBOutlet UITextField *txtValue;

/**
 “我变变变！” 按钮点击事件，用来处理按钮点击后的事情。
 此例中用来发送代理，并退出当前窗体
 */
- (IBAction)pressChange:(id)sender;

@end
