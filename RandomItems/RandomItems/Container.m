//
//  Container.m
//  RandomItems
//
//  Created by 胡振生 on 15/11/28.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import "Container.h"

@implementation Container

- (instancetype) initWithItemName:(NSString *)name valuePrice:(int)preice serialNumber:(NSString *)sn
{
    self = [super initWithItemName:name valuePrice:preice serialNumber:sn];
    if (self) {
        _subItems = [[NSMutableArray alloc] init];
        _totalValue = preice;
    }
    return self;
}

- (void) addTotal:(int)value
{
    self.totalValue = self.totalValue + value;
}

- (void) addItemToContainer:(Item *)item
{
    [self.subItems addObject:item];
    [self addTotal:item.valuePrice];
}

- (void)addContainerToContainer:(Container *)item
{
    [self.subItems addObject:item];
    [self addTotal:item.totalValue];
}

- (NSString *)description{
    
    NSString *descriptionString = [[NSString alloc]initWithFormat:@"This is the description of Contianer and the item its Containing.\nContainer: %@ (%@) Worth %d, Record on %@", self.itemName, self.serialNumber, self.totalValue,self.dateCreated ];
    
    for (Item *item in self.subItems) {
        NSString *itemString = [[NSString alloc] initWithFormat:@"\nSubItem: %@", item];
        descriptionString = [descriptionString stringByAppendingString:itemString];
    }
    
    return descriptionString;
}

@end
