//
//  HZSViewShop.m
//  团购列表练习
//
//  Created by 胡振生 on 16/2/14.
//  Copyright © 2016年 胡振生. All rights reserved.
//

#import "HZSViewShopCell.h"

@implementation HZSViewShopCell
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)viewShopWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSMutableArray *)viewShopList
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *groupBuyings = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        HZSViewShopCell *groupBuying = [[HZSViewShopCell alloc] initWithDic:dic];
        [groupBuyings addObject:groupBuying];
    }
    return groupBuyings;
}
@end
