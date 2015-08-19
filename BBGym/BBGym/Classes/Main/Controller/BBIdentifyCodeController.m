//
//  BBIdentifyCodeController.m
//  BBGym
//
//  Created by Michael on 8/19/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "BBIdentifyCodeController.h"
#import "UIView+Extension.h"

@interface BBIdentifyCodeController ()
@property (nonatomic, strong) NSMutableArray *deals;

@end

@implementation BBIdentifyCodeController
{
    UIView *header;
}

static NSString * const reuseIdentifier = @"Cell";
static NSString * const kheaderIdentifier = @"kheaderIdentifier";

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // cell的大小
    layout.itemSize = CGSizeMake(100, 100);
    return [self initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置背景色
    //BBColor(230, 230, 230)
    self.view.backgroundColor = BBColor(219, 218, 219);
    self.collectionView.backgroundColor =[UIColor whiteColor];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
   
    [self createButtonArray];
    
    header=[[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.width, 200)];
    header.backgroundColor=[UIColor redColor];
    
     [self.collectionView registerNib:[UINib nibWithNibName:@"BBIdentityHearderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kheaderIdentifier];

}

-(void)createButtonArray
{
    _deals=[[NSMutableArray alloc]init];
    [self getItemWithImage:@"个人介绍" action:@selector(personal)];
    [self getItemWithImage:@"发布课程" action:@selector(pubCourse)];
    [self getItemWithImage:@"课程管理" action:@selector(CourseCongure)];
    [self getItemWithImage:@"我的视频" action:@selector(Video)];
    [self getItemWithImage:@"我的钱包" action:@selector(Wallet)];
    [self getItemWithImage:@"我的学员" action:@selector(Student)];
    [self getItemWithImage:@"设置" action:@selector(Setting)];
    [self getItemWithImage:@"客服" action:@selector(CustomerService)];
    [self getItemWithImage:@"加号" action:@selector(add)];

}

-(void)getItemWithImage:(NSString *)image action:(SEL)action
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    button.size = CGSizeMake(50, 50);
    [_deals addObject:button];
}



#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _deals.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
   
    cell.backgroundView=_deals[indexPath.item];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    
}

//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={320,140};
    return size;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:kheaderIdentifier   forIndexPath:indexPath];
    
    UILabel *label = (UILabel *)[view viewWithTag:1];
    label.text = [NSString stringWithFormat:@"这是header:%ld",(long)indexPath.section];
    
    return view;
}



@end
