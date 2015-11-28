//
//  main.m
//  RandomItems
//
//  Created by 胡振生 on 15/11/25.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "Container.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建并初始化 NSMutableArray 对象，并用 items 保存返回的指针对象的地址
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        // 使用自定义的类
        for (int i = 0; i< 10; i++) {
            Item *item = [Item randomItem];
            items[i] = item;
            NSLog(@"%@", item);
        }
        // 异常代码
        // NSLog(@"%@", items[10]);
        
        NSLog(@"New SubItem");
        Container *containerItemBig = [ [Container alloc] initWithItemName:@"BackPack" valuePrice:200 serialNumber:@"2we33rdwwd"];
        Container *containerItemSmall = [ [Container alloc] initWithItemName:@"Pocket" valuePrice:100 serialNumber:@"2we33rdwwd"];
        for (int i=0; i<3; i++) {
            Item *item = [Item randomItem];
            [containerItemBig addItemToContainer:item];
        }
        
        for (int i=0; i<3; i++) {
            Item *item = [Item randomItem];
            [containerItemSmall addItemToContainer:item];
        }
        
        [containerItemBig addContainerToContainer:containerItemSmall];
        
        NSLog(@"%@", containerItemBig);
        
        
        items = nil;
    }
    return 0;
}
