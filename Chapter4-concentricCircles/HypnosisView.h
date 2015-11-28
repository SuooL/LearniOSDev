//
//  HypnosisView.h
//  Chapter4-concentricCircles
//
//  Created by 胡振生 on 15/11/28.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HypnosisView : UIView
@property (nonatomic, strong) UIColor* circleColor;
void CGContextSetShadow (
                         CGContextRef context,
                         CGSize offset,
                         CGFloat blur);
@end
