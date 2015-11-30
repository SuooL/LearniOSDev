//
//  Item.h
//  RandomItems
//
//  Created by 胡振生 on 15/11/25.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
+ (instancetype) randomItem;

- (instancetype) initWithItemName:(NSString *)name
                       valuePrice:(int) preice
                     serialNumber:(NSString *)sn;

- (instancetype)initWithItemName:(NSString *)name
                      valuePrice:(int) preice;    // 第二个初始化方法

-(instancetype) initWithItemName:(NSString *)name;


@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valuePrice;
@property (nonatomic, readonly, strong) NSDate *dateCreated;
@property (nonatomic, copy)NSString *itemKey;
@end
