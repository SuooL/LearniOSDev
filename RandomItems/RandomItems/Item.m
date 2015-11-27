//
//  Item.m
//  RandomItems
//
//  Created by 胡振生 on 15/11/25.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import "Item.h"

@implementation Item
- (void) setItemName:(NSString *) str
{
    _itemName = str;
}
- (NSString *) itemName
{
    return _itemName;
}
- (void) setSerialNumber:(NSString *) str
{
    _serialNumber = str;
}
- (NSString *) serialNumber
{
    return _serialNumber;
}
- (void) setValuePrice: (int) price
{
    _valuePrice = price;
}
- (int) valuePrice
{
    return _valuePrice;
}
- (NSDate *) dateCreate
{
    return _dateCreate;
}

- (NSString *) description
{
    NSString *descriptionString = [[NSString alloc]initWithFormat:@"%@(%@): Worth: %d, Recorded on  %@", self.itemName, self.serialNumber, self.valuePrice, self.dateCreate];
    
    return  descriptionString;
}

@end
