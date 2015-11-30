//
//  ImageStore.m
//  Homepwner9P
//
//  Created by 胡振生 on 15/11/30.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import "ImageStore.h"

@interface ImageStore ()
@property (nonatomic, strong) NSMutableDictionary *dictionary;
@end

@implementation ImageStore
+(instancetype)sharedStore
{
    static ImageStore *imageStore = nil;
    if (imageStore==nil) {
        imageStore = [[self alloc]initPrivate]; // 此时 self 还是 nil，所以要先 alloc
    }
    
    return imageStore;
}

-(instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[ImageStore sharedStore]" userInfo:nil];
    
    return nil;
}
-(instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _dictionary = [[NSMutableDictionary alloc]init];
    }
    
    return self;
}


- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key
{
    return self.dictionary[key];
}

- (void)deleteImageForkry:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}

@end
