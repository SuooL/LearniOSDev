//
//  BNRAppliance.m
//  OC_initFunc
//
//  Created by 胡振生 on 16/1/12.
//  Copyright © 2016年 胡振生. All rights reserved.
//

#import "BNRAppliance.h"

@implementation BNRAppliance

// override the init function of BARAppliance
- (instancetype) init
{
    NSLog(@"默认的 init 方法");
    return  [self initWithProductName:@"UnknowName"];
}

/*
 关于 init 方法：
 上面是重写默认的 init 方法，使其能够做一些指定的初始化工作。
 其中，第一行是调用其父类（此处是 NSObject ）的 init 方法初始化，
 然后在下面的使用中需要先检查 self 是否为 nil ，这是 Apple 推荐的写法。
 这样检查是为了防止一些特殊情况的发生，虽然这些情况不太可能发生。
*/

- (instancetype)initWithProductName:(NSString *)pn
{
    NSLog(@"指定初始化名字的 init 方法");
    self = [super init];
    
    if (self) {
        // _productName = pn;
        // _voltage = 20;
        [self setProductName:pn];
        [self setVoltage:20];
    }
    
    // 上面是两种不同风格的为变量初始化的方法，第一种直接设置变量的值，第二种则是调用了类的存取方法。两种皆可以使用。
    
    return self;
}


@end