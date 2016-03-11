//
//  AccountManager.h
//  qzc
//
//  Created by jxm apple on 16/2/3.
//  Copyright © 2016年 xinggenji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAccount.h"
#import "CAccount.h"
#include "KAccount.h"

#define PAccounts @"pAccounts"
#define CAccounts @"cAccounts"
#define KAccounts @"kAccounts"

@class PAccount;
@class CAccount;
@class KAccount;
@class Account;
@interface AccountManager : NSObject

@property (nonatomic,strong) NSMutableArray<PAccount*> * pAccounts;
@property (nonatomic,strong) NSMutableArray<KAccount*>  * kAccounts;
@property (nonatomic,strong) NSMutableArray<CAccount*>  * cAccounts;
@property (nonatomic, strong) Account *currentAccount;


/**
 *  创建单例
 *
 *  @return 返回一个单例对象
 */
+(AccountManager*)shareAccount;

/**
 *  读取当前账户方法
 *
 *  @return 返回当前账户模型
 */
-(Account*)getCurrentAccountForKey:(NSString *)key;

/**
 *  保存当前账户方法
 *
 */
-(void)saveCurrentAccount:(Account *)account forKey:(NSString *)key;

/**
 *  读取本地PAccount
 *
 */
- (PAccount *)readPAccount;

/**
 *  读取本地CAccount
 *
 */
- (CAccount *)readCAccount;

/**
 *  读取本地KAccount
 *
 */
- (KAccount *)readKAccount;
@end
