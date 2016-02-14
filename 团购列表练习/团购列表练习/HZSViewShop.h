//
//  HZSViewShop.h
//  团购列表练习
//
//  Created by 胡振生 on 16/2/14.
//  Copyright © 2016年 胡振生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZSViewShopCell: NSObject

@property (nonatomic, copy) NSString *buyCount;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *title;


- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)viewShopWithDic:(NSDictionary *)dic;

+ (NSMutableArray *)viewShopList;

@end
