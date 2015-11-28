//
//  Container.h
//  RandomItems
//
//  Created by 胡振生 on 15/11/28.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import "Item.h"

@interface Container : Item
{
    
}
@property (nonatomic, strong) NSMutableArray * subItems;
@property (nonatomic) int totalValue;

// Container 类的指定初始化方法
- (instancetype)initWithItemName:(NSString *)name valuePrice:(int)preice serialNumber:(NSString *)sn;

- (void)addTotal:(int)value;
- (void)addItemToContainer:(Item *)item;
- (void)addContainerToContainer:(Container *)item;
@end
