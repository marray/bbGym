//
//  BBHomeViewController.m
//  BBGym
//
//  Created by Michael on 8/19/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "BBHomeViewController.h"
#import "BBIdentifyCodeController.h"

@interface BBHomeViewController ()

@end

@implementation BBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *bnt=[UIButton buttonWithType:UIButtonTypeCustom];
    bnt.frame=CGRectMake(50, 150, 80, 50);
    bnt.backgroundColor=[UIColor redColor];
    [bnt setTitle:@"验证码" forState:UIControlStateNormal];
    [bnt addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bnt];
}

-(void)click
{
    BBIdentifyCodeController *identifyCode=[[BBIdentifyCodeController alloc] init];
    [self.navigationController pushViewController:identifyCode animated:YES];
    
}


@end
