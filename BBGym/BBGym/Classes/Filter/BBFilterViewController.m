//
//  BBFilterViewController.m
//  BBGym
//
//  Created by Apple on 15/8/20.
//  Copyright (c) 2015年 agIce. All rights reserved.
//

#import "BBFilterViewController.h"
#import "UIView+Extension.h"
#import "UIView+AutoLayout.h"
#import "BBFilterViewCell.h"

@interface BBFilterViewController ()
@property(nonatomic,strong) UIView *headerView;

@property(nonatomic,strong) UIButton * hot;
@property(nonatomic,strong) UIButton * assess;
@property(nonatomic,strong) UIButton * distance;

@end

@implementation BBFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISearchBar *search=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 250, 44)];
    [self.navigationItem setTitleView:search];
    self.navigationItem.leftBarButtonItem.title=@"地址 ";
    
    _headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width,54)];
    
    _hot=[self getHeaderButtonWithTitle:@"按热度" action:@selector(hotClick) left:0 right:(_headerView.width/3)*2];
    _hot.selected=YES;
    _assess=[self getHeaderButtonWithTitle:@"按评价" action:@selector(assessClick) left:_headerView.width/3 right:_headerView.width/3];
    _distance=[self getHeaderButtonWithTitle:@"按距离" action:@selector(distanceClick) left:(_headerView.width/3)*2 right:0];
    

    self.tableView.tableHeaderView=_headerView;
}


-(UIButton *)getHeaderButtonWithTitle:(NSString *)title action:(SEL)action left:(CGFloat)left right:(CGFloat)right
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectZero;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.layer setBorderWidth:0.5];
    [btn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [btn setBackgroundImage:[UIImage imageNamed:@"矩形-27-拷贝"] forState:UIControlStateSelected];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:btn];
    UIEdgeInsets inset=UIEdgeInsetsMake(0, left, 0, right);
    [btn autoPinEdgesToSuperviewEdgesWithInsets:inset];
    
    return btn;
}

-(void)hotClick
{
    _hot.selected=YES;
    _assess.selected=NO;
    _distance.selected=NO;
}

-(void)assessClick
{
    _hot.selected=NO;
    _assess.selected=YES;
    _distance.selected=NO;
}
-(void)distanceClick
{
    _hot.selected=NO;
    _assess.selected=NO;
    _distance.selected=YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BBFilterViewCell *cell = [BBFilterViewCell initWithStyle:UITableViewCellStyleDefault tableView:tableView];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


@end
