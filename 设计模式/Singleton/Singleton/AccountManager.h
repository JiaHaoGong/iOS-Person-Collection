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

//账户保存本地数据键
#define CurrentAccount @"CurrentAccount"
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
@property (nonatomic,strong) Account *currentAccount;


/**
 *  创建单例
 *
 *  @return 返回一个单例对象
 */
+(AccountManager*)shareAccount;

@end
