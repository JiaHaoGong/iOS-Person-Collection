//
//  ViewController.m
//  Singleton
//
//  Created by ylgwhyh on 16/3/15.
//  Copyright © 2016年 com.ylgwhyh.cn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showSaveModelWithUserDefaults];
    [self showSavepAccountModelWithUserDefaults];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//演示保存模型到userDefaults
- (void)showSaveModelWithUserDefaults{
    //保存Account模型
    Account *account = [[Account alloc] init];
    account.acc = @"特使";
    account.accId = @"特使";
    account.accToken = @"特使";
    account.crtime = @"特使";
    
    //保存Account模型到本地
    [AccountManager shareAccount].currentAccount = account;
    
    //从本地读取Account
    Account *getCurrentAccount = [AccountManager shareAccount].currentAccount;
    NSLog(@"getCurrentAccount.acc%@",getCurrentAccount.acc);
}

//测试PAccount、CAccount、KAccount的保存和读取
- (void)showSavepAccountModelWithUserDefaults
{
    //保存PAccount模型
    PAccount *pAccount = [[PAccount alloc] init];
    pAccount.acc = @"父类";
    pAccount.nearVisible = @"测试";
    pAccount.sex = @"测试";
    pAccount.star = @"测试";
    NSArray *pAccountModelArray = [NSArray arrayWithObject:pAccount];
    NSMutableArray *pAccountArray = [[NSMutableArray alloc] init];
    [pAccountArray addObjectsFromArray:pAccountModelArray];
    
    [AccountManager shareAccount].pAccounts = pAccountArray;
    
    //从本地读取账户模型
    PAccount *testP = [AccountManager shareAccount].pAccounts;
    NSLog(@"testP%@",testP.acc);
    
    
    //保存CAccount模型
    CAccount *cAccount = [[CAccount alloc] init];
    cAccount.acc = @"父类";
    cAccount.areaId = @"测试";
    cAccount.sex = @"测试";
    cAccount.star = @"测试";
    NSArray *cAccountModelArray = [NSArray arrayWithObject:cAccount];
    NSMutableArray *cAccountArray = [[NSMutableArray alloc] init];
    [cAccountArray addObjectsFromArray:cAccountModelArray];
    
    [AccountManager shareAccount].cAccounts = cAccountArray;
    
    //从本地读取账户模型
    CAccount *testC = [AccountManager shareAccount].cAccounts;
    NSLog(@"testC%@",testC.acc);
    NSLog(@"testC%@",testC.star);
    
    
    //保存KAccount模型
    KAccount *kAccount = [[KAccount alloc] init];
    kAccount.acc = @"父类";
    kAccount.job = @"测试";
    NSArray *kAccountModelArray = [NSArray arrayWithObject:kAccount];
    NSMutableArray *kAccountArray = [[NSMutableArray alloc] init];
    [kAccountArray addObjectsFromArray:kAccountModelArray];
    
    [AccountManager shareAccount].kAccounts = kAccountArray;
    
    //从本地读取账户模型
    KAccount *testK = [AccountManager shareAccount].kAccounts;
    NSLog(@"testK%@",testK.acc);
    NSLog(@"testK%@",testK.job);
    
}
@end
