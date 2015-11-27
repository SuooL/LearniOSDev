//
//  Item.h
//  RandomItems
//
//  Created by 胡振生 on 15/11/25.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valuePrice;
    NSDate *_dateCreate;
}

- (instancetype) initWithItemName:(NSString *)name
                       valuePrice:(int) preice
                     serialNumber:(NSString *)sn;

-(instancetype) initWithItemName:(NSString *)name;

- (void) setItemName:(NSString *) str;
- (NSString *) itemName;
- (void) setSerialNumber:(NSString *) str;
- (NSString *) serialNumber;
- (void) setValuePrice: (int) price;
- (int) valuePrice;
- (NSDate *) dateCreate;
@end
