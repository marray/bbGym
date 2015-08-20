//
//  BBIdentifyCodeController.m
//  BBGym
//
//  Created by Michael on 8/19/15.
//  Copyright (c) 2015 agIce. All rights reserved.
//

#import "BBIdentifyCodeController.h"
#import "UIView+Extension.h"
#import "MyCell.h"

@interface BBIdentifyCodeController ()
@property (nonatomic, strong) NSMutableArray *deals;

@end

@implementation BBIdentifyCodeController

static NSString * const reuseIdentifier = @"MyCell";
static NSString * const kheaderIdentifier = @"kheaderIdentifier";

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // cell的大小
//    layout.itemSize = CGSizeMake(100,100);
    return [self initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置背景色
    //BBColor(230, 230, 230)
    self.view.backgroundColor = BBColor(219, 218, 219);
    self.collectionView.backgroundColor =[UIColor whiteColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
   
    [self createButtonArray];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"BBIdentityHearderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kheaderIdentifier];

}

-(void)createButtonArray
{
    _deals=[[NSMutableArray alloc]init];
    [_deals addObjectsFromArray:@[@"个人介绍", @"发布课程", @"课程管理", @"我的视频" , @"我的钱包", @"我的学员", @"设置", @"客服", @"加号"]];
}

-(void)getItemWithImage:(NSString *)image action:(SEL)action
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [_deals addObject:button];
}


#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _deals.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSLog(@"%@",_deals[indexPath.row]);
    [cell.btn setBackgroundImage:[UIImage imageNamed:_deals[indexPath.row]] forState:UIControlStateNormal];
    
    return cell;
}


#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"22");
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGFloat width = rect.size.width;
    NSLog(@"宽度：%f",width);
    if(width==320){
        return CGSizeMake(80, 80);
    }
    return CGSizeMake(80, 80);
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

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 20, 20);
}


@end
