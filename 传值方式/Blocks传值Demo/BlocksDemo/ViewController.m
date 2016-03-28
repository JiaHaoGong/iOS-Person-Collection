//
//  ViewController.m
//  BlocksDemo
//
//  Created by zhangxiao on 13-12-30.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 50)];
    [self.view addSubview:valueLabel];
    [valueLabel release];
    
    UIBarButtonItem *nextBtn = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(nextClick)];
    self.navigationItem.rightBarButtonItem = nextBtn;
    [nextBtn release];
}

- (void)nextClick
{
    //将第二个页面的值带回来
    SecondViewController *svc = [[SecondViewController alloc] init];
    svc.backValue = ^(NSString *strValue) {
        valueLabel.text = strValue;
    };
    [self.navigationController pushViewController:svc animated:YES];
    [svc release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
