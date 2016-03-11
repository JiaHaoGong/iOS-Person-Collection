//
//  AccountManager.m
//  qzc
//
//  Created by jxm apple on 16/2/3.
//  Copyright © 2016年 xinggenji. All rights reserved.
//

#import "AccountManager.h"

static AccountManager *accountManagerData = nil;

@implementation AccountManager


+(AccountManager*)shareAccount{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        accountManagerData = [[AccountManager alloc] init];
    });
    return accountManagerData;
}

- (void)setCurrentAccount:(Account *)currentAccount{
    _currentAccount = currentAccount;
}

-(Account*)getCurrentAccountForKey:(NSString *)key{

    //利用userDefault存储
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //读取NSData数据
    NSData *dataRead = [userDefaults dataForKey:key];
    //转换DSData数据
    Account *currentAccountModel= [NSKeyedUnarchiver unarchiveObjectWithData:dataRead];
    
    return currentAccountModel;
}

-(void)saveCurrentAccount:(Account *)account forKey:(NSString *)key{

    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:account];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:data forKey:key];
}



- (void)setCAccounts:(NSMutableArray<CAccount *> *)cAccounts{
    if ([cAccounts isKindOfClass:[NSMutableArray class]]){
        NSMutableArray *dataArray =[[NSMutableArray alloc] init];
        for(CAccount *cAc in cAccounts){
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cAc];
            [dataArray addObject:data];
        }
        
        NSArray *arraySave = [NSArray arrayWithArray:dataArray];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:arraySave forKey:CAccounts];
    }
}


- (CAccount *)readCAccount{
    //从本地读取账户模型
    NSUserDefaults *userDefaultsRead = [NSUserDefaults standardUserDefaults];
    NSArray *arrayRead = [userDefaultsRead arrayForKey:CAccounts];
    //转换DSData数据
    CAccount *cAccount;
    for (NSData *data in arrayRead) {
        cAccount = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    
    return cAccount;
}



- (void)setKAccounts:(NSMutableArray<KAccount *> *)kAccounts{
    if ([kAccounts isKindOfClass:[NSMutableArray class]]){
        NSMutableArray *dataArray =[[NSMutableArray alloc] init];
        for(KAccount *kAc in kAccounts){
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:kAc];
            [dataArray addObject:data];
        }
        
        NSArray *arraySave = [NSArray arrayWithArray:dataArray];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:arraySave forKey:KAccounts];
    }
}


- (KAccount *)readKAccount{
    //从本地读取账户模型
    NSUserDefaults *userDefaultsRead = [NSUserDefaults standardUserDefaults];
    NSArray *arrayRead = [userDefaultsRead arrayForKey:KAccounts];
    //转换DSData数据
    KAccount *kAccount;
    for (NSData *data in arrayRead) {
        kAccount = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    
    return kAccount;
}


/***
 保存模型数组
 @param 模型数组
*/
- (void)setPAccounts:(NSMutableArray<PAccount *> *)pAccounts{
    //是pAccount模型数组的处理方式
    if([pAccounts isKindOfClass:[NSMutableArray class]]){
        //保存账户模型数组到本地
        NSMutableArray *dataArray =[[NSMutableArray alloc] init];
        for(PAccount *pAc in pAccounts){
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:pAc];
            [dataArray addObject:data];
        }
        
        NSArray *arraySave = [NSArray arrayWithArray:dataArray];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:arraySave forKey:PAccounts];
    }

}


- (PAccount *)readPAccount{
    //从本地读取账户模型
    NSUserDefaults *userDefaultsRead = [NSUserDefaults standardUserDefaults];
    NSArray *arrayRead = [userDefaultsRead arrayForKey:PAccounts];
    //转换DSData数据
    PAccount *pAccount;
    for (NSData *data in arrayRead) {
        pAccount = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    
    return pAccount;
}

//重写get方法，在get方法中保存
- (PAccount *)pAccounts{
    
    //从本地读取账户模型
    NSUserDefaults *userDefaultsRead = [NSUserDefaults standardUserDefaults];
    NSArray *arrayRead = [userDefaultsRead arrayForKey:PAccounts];
    //转换DSData数据
    PAccount *pAccount;
    for (NSData *data in arrayRead) {
        pAccount = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    
    return pAccount;
}

@end
