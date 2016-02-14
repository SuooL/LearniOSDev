//
//  HZSTableViewCell.m
//  LastTry
//
//  Created by 胡振生 on 16/2/14.
//  Copyright © 2016年 胡振生. All rights reserved.
//

#import "HZSTableViewCell.h"

@implementation HZSTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setInfoOfCell:(shopInfo *)shopInfo{
    self.title.text = shopInfo.title;
    self.price.text = [NSString stringWithFormat:@"%@元", shopInfo.price];
    self.count.text = [NSString stringWithFormat:@"已售出%@份", shopInfo.buyCount];
    self.iconView.image = [UIImage imageNamed:shopInfo.icon];
}

@end
