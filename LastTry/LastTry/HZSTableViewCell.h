//
//  HZSTableViewCell.h
//  LastTry
//
//  Created by 胡振生 on 16/2/14.
//  Copyright © 2016年 胡振生. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shopInfo.h"

@interface HZSTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *count;

-(void)setInfoOfCell:(shopInfo *)shopInfo;


@end
