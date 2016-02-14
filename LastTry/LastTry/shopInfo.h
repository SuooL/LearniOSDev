//
//  shopInfo.h
//  LastTry
//
//  Created by 胡振生 on 16/2/14.
//  Copyright © 2016年 胡振生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shopInfo : NSObject
@property(nonatomic) NSString *buyCount;
@property(nonatomic) NSString *title;
@property(nonatomic) NSString *price;
@property(nonatomic) NSString *icon;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)shopInfoWithDic:(NSDictionary *)dic;

+ (NSMutableArray *)shopInfoList;


@end
