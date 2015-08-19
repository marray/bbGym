//
//  BBTabBarController.m
//  BBGym
//
//  Created by Michael on 8/19/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "BBTabBarController.h"
#import "BBIdentifyCodeController.h"
#import "BBPersonalViewController.h"
#import "BBFilterViewController.h"

@interface BBTabBarController ()

@end

@implementation BBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    BBIdentifyCodeController *home=[[BBIdentifyCodeController alloc] init];
    [self childController:home WithTitle:@"首页" image:@"shouye" selectedImage:@" "];
    
    BBFilterViewController *message=[[BBFilterViewController alloc] init];
    [self childController:message WithTitle:@"筛选" image:@"saixuan" selectedImage:@" "];
    
    BBPersonalViewController *discover=[[BBPersonalViewController alloc] init];
    [self childController:discover WithTitle:@"我的" image:@"我的" selectedImage:@" "];
    
    
}


/**
 *  添加一个子控制器
 *
 *  @param vControl      控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中市的图片
 */
-(void)childController:(UIViewController *)vControl WithTitle:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //    vControl.tabBarItem.title=title;   //设置tabBarItem的标题
    //    vControl.navigationItem.title=title;  //设置导航栏控制器的标题
    //设置标题
    vControl.title=title;   //相当于上面两句  设置导航栏和tabBarItem的标题
    //设置图片
    vControl.tabBarItem.image=[UIImage imageNamed:image];
    vControl.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vControl.view.backgroundColor=BBRandomColor;
    
    //设置tabBarItem字体颜色
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName]=BBColor(123, 123, 123);
    NSMutableDictionary *dictSelect=[NSMutableDictionary dictionary];
    dictSelect[NSForegroundColorAttributeName]=BBColor(245, 122, 118);
    [vControl.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    [vControl.tabBarItem setTitleTextAttributes:dictSelect forState:UIControlStateSelected ];
    
    //包装控制器为导航控制器
    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:vControl];
    [self addChildViewController:nav];
    
}



@end
