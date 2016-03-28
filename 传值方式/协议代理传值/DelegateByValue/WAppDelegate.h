//
//  WAppDelegate.h
//  DelegateByValue
//
//  Created by wzrong on 13-7-20.
//  Copyright (c) 2013年 wzrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WViewController;

@interface WAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) WViewController *viewController;

@end
