//
//  HeadView.h
//  LastTry
//
//  Created by 胡振生 on 16/2/14.
//  Copyright © 2016年 胡振生. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadView : UIView
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewAD;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;

+(instancetype)headerView;
@end
