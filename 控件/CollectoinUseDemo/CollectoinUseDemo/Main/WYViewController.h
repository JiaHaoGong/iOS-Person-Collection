//
//  WYViewController.h
//  CollectoinUseDemo
//
//  Created by Yong on 14-8-27.
//  Copyright (c) 2014年 Numob.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end
