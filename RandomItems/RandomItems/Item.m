//
//  Item.m
//  RandomItems
//
//  Created by 胡振生 on 15/11/25.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import "Item.h"

@implementation Item

+ (instancetype) randomItem
{
    NSArray *randomFirstNameList = @[@"Hu", @"Li", @"Mian"];
    NSArray *randomLastNameList = @[@"Shuo", @"Jun", @"Zhen"];
    
    NSString *randomName = [NSString  stringWithFormat:@"%@%@", randomFirstNameList[ arc4random()% [randomFirstNameList count]], randomLastNameList[arc4random()% [randomLastNameList count]]];
    
    int randomValue = arc4random() % 100;
    
    NSString *serialNumber = [NSString stringWithFormat:@"%c%c%c%c%c%c",
                              '0' + arc4random() % 10,
                              'A' + arc4random() % 26,
                              '0' + arc4random() % 10,
                              'A' + arc4random() % 26,
                              '0' + arc4random() % 10,
                              'A' + arc4random() % 26];
    Item * newItem = [ [self alloc] initWithItemName:randomName valuePrice:randomValue serialNumber:serialNumber];
    
    
    return newItem;
}

// 初始化方法
- (instancetype) initWithItemName:(NSString *)name valuePrice:(int)preice serialNumber:(NSString *)sn
{
    self = [super init];
    if (self) {
        _itemName = name;
        _valuePrice = preice;
        _serialNumber = sn;
        _dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}

- (instancetype) initWithItemName:(NSString *)name valuePrice:(int)preice
{
    return [self initWithItemName:name valuePrice:preice serialNumber:@"0"];
}

- (instancetype) initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valuePrice:0];
}

- (instancetype) init
{
    return [self initWithItemName:@"item"];
}

// 覆盖父类方法
- (NSString *) description
{
    NSString *descriptionString = [[NSString alloc]initWithFormat:@"%@(%@): Worth: %d, Recorded on  %@", self.itemName, self.serialNumber, self.valuePrice, self.dateCreated];
    
    return  descriptionString;
}

// 自定义的存方法
- (void)setContainItem:(Item *)containItem
{
    _containItem = containItem;
    self.container = self;
}

@end
