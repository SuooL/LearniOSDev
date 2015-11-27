//
//  main.m
//  RandomItems
//
//  Created by 胡振生 on 15/11/25.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Item.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建并初始化 NSMutableArray 对象，并用 items 保存返回的指针对象的地址
        NSMutableArray *items = [[NSMutableArray alloc] init];
        // 向 items 所指向的 NSMutableArray 对象发送消息，存入数据
        [items addObject:@"One"];
        [items addObject:@"TWo"];
        [items addObject:@"Three"];
        // 换种方式发消息，插入数据
        [items insertObject:@"Zero" atIndex:0];
        // 循环输出
        for (int i = 0; i < [items count]; i++) {
            NSString *item = [items objectAtIndex:i];
            NSLog(@"第一种循环方式输出%@", item);
        }
        // 循环输出
        for(NSString *item in items){
            NSLog(@"第二种循环方式的输出%@", item);
        }
        
        items = nil;
        
        // 使用自定义的类
        Item *item = [[Item alloc]init];
        item.itemName = @"MacBookPro";
        item.valuePrice = 12988;
        item.serialNumber = @"CNKS2328";
        
        NSLog(@"%@ %@ %@ %d", item.itemName, item.serialNumber, item.dateCreate, item.valuePrice);
        
        NSLog(@"%@", item);
    }
    return 0;
}
