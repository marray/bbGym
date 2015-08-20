//
//  BBFilterViewCell.m
//  BBGym
//
//  Created by Apple on 15/8/20.
//  Copyright (c) 2015年 agIce. All rights reserved.
//

#import "BBFilterViewCell.h"

@implementation BBFilterViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)initWithStyle:(UITableViewCellStyle)style tableView:(UITableView *)myTableView{
    static NSString *ID=@"FilterCell";
    BBFilterViewCell * cell = [myTableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = (BBFilterViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"BBFilterViewCell" owner:self options:nil]  lastObject];
    }
    return cell;
}


@end
