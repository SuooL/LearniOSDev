//
//  ImageStore.h
//  Homepwner9P
//
//  Created by 胡振生 on 15/11/30.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageStore : NSObject
+(instancetype)sharedStore;

-(void) setImage : (UIImage *) image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
-(void) deleteImageForkry:(NSString *)key;

@end
