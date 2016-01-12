//
//  BNRAppliance.h
//  OC_initFunc
//
//  Created by 胡振生 on 16/1/12.
//  Copyright © 2016年 胡振生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRAppliance : NSObject

@property (nonatomic, copy) NSString *productName;
@property (nonatomic) int voltage;

- (instancetype)initWithProductName :(NSString*) pn; // 指定的初始化方法

@end
