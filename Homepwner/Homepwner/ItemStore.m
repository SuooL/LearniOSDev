//
//  ItemStroe.m
//  Homepwner
//
//  Created by 胡振生 on 15/11/29.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import "ItemStore.h"
#import "Item.h"

@interface ItemStore()
@property (nonatomic) NSMutableArray *privateItems;
@end

@implementation ItemStore

// 单例模式
+(instancetype) sharedStore
{
    static ItemStore *itemStore = nil;
    if (! itemStore) {
        itemStore = [[self alloc]initPrivate];
    }
    
    return itemStore;
}

-(instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [ItemStore sharedStore]" userInfo:nil];
    
    return nil;
}

-(instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc]init];
    }
    return self;
}

-(NSArray *)allItems
{
    return self.privateItems;
}

-(Item *)createItem
{
    Item *item = [Item randomItem];
    [self.privateItems addObject:item];
    
    return item;
}

@end
