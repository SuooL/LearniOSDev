//
//  shopInfo.m
//  LastTry
//
//  Created by 胡振生 on 16/2/14.
//  Copyright © 2016年 胡振生. All rights reserved.
//

#import "shopInfo.h"

@implementation shopInfo
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)shopInfoWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSMutableArray *)shopInfoList
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *shopArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        shopInfo *shop = [[shopInfo alloc] initWithDic:dic];
        [shopArray addObject:shop];
    }
    return shopArray;
}


@end
