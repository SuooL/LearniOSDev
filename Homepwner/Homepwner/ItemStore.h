//
//  ItemStroe.h
//  Homepwner
//
//  Created by 胡振生 on 15/11/29.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@interface ItemStore : NSObject
@property(nonatomic, readonly) NSArray * allItems;

+(instancetype) sharedStore;

-(Item *) createItem;
@end
