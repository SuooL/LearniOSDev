//
//  BNROwnedAppliance.h
//  OC_initFunc
//
//  Created by 胡振生 on 16/1/12.
//  Copyright © 2016年 胡振生. All rights reserved.
//

#import "BNRAppliance.h"

@interface BNROwnedAppliance : BNRAppliance
@property (nonatomic) NSSet *ownerNames;

-(instancetype)initWithProductName:(NSString *)pn
                    firstOwnerName:(NSString*)n;

-(void) addOwnerName:(NSString*)n;
-(void) removeOwnerName:(NSString*)n;
@end
