//
//  BNROwnedAppliance.m
//  OC_initFunc
//
//  Created by 胡振生 on 16/1/12.
//  Copyright © 2016年 胡振生. All rights reserved.
//

#import "BNROwnedAppliance.h"
@interface BNROwnedAppliance()
{
    NSMutableSet* _ownerNames;
}
@end

@implementation BNROwnedAppliance

/*
 关于指定初始化方法
 编写的其他的初始化方法都应该（直接或间接的）调用指定的初始化方法
 指定的初始化方法应该先调用父类的指定初始化方法，然后对实例变量进行初始化
 如果某个类的制定初始化方法和父类的不同（方法名不同），就必须覆盖父类的方法，并调用新的方法
 如果某个类有多个初始化方法，就应该在头文件中，明确的说明那个方法是指定的初始化方法
 */

-(instancetype) initWithProductName:(NSString *)pn firstOwnerName:(NSString *)n
{
    if (self = [super initWithProductName:pn]) {
        _ownerNames = [[NSMutableSet alloc]init];
        if (n) {
            [_ownerNames addObject:n];
        }
    }
    
    return self;
}

- (instancetype)initWithProductName:(NSString *)pn
{
    return [self initWithProductName:pn firstOwnerName:nil];
}

- (void)addOwnerName:(NSString *)n
{
    [_ownerNames addObject:n];
}

-(void)removeOwnerName:(NSString *)n
{
    [_ownerNames removeObject:n];
}

-(NSSet *)ownerNames
{
    return [_ownerNames copy];
}


@end
