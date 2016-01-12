//
//  main.m
//  OC_initFunc
//
//  Created by 胡振生 on 16/1/12.
//  Copyright © 2016年 胡振生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRAppliance.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        BNRAppliance *bnra = [[BNRAppliance alloc]init];
        NSLog(@"bnra's voltae is %d, productname is %@", bnra.voltage, bnra.productName);
        
        BNRAppliance *bnraName = [[BNRAppliance alloc]initWithProductName:@"MAC"];
        NSLog(@"bnra's voltae is %d, productname is %@", bnraName.voltage, bnraName.productName);
    }
    return 0;
}
