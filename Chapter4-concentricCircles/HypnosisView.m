//
//  HypnosisView.m
//  Chapter4-concentricCircles
//
//  Created by 胡振生 on 15/11/28.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import "HypnosisView.h"
@interface HypnosisView()
@property (nonatomic, strong) UIColor* circleColor;
@end

@implementation HypnosisView

-(void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void) drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.y + bounds.size.height/2.0;
//    float radius = (MIN(bounds.size.width, bounds.size.height)/2.0) ;
    float radius = hypot(bounds.size.width, bounds.size.height)/2.0;
    UIBezierPath *path = [[UIBezierPath alloc]init];
    for (float currentRadius = radius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(currentRadius + center.x, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI*2 clockwise:YES];
    }
    
    path.lineWidth = 10;
    [self.circleColor setStroke];
    [path stroke];
    
    UIBezierPath *tpath =[[UIBezierPath alloc] init];
    [tpath moveToPoint:CGPointMake(160, 110)];
    [tpath addLineToPoint:CGPointMake(70, 400)];
    [tpath addLineToPoint:CGPointMake(250, 400)];
    [tpath closePath];
    [tpath stroke];
    CGContextRef currentContext1 = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext1);
    [tpath addClip];
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {1.0, 0.0, 0.0, 1.0,
        1.0, 1.0, 0.0, 1.0};
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    CGPoint startPoint = CGPointMake(160, 400);
    CGPoint endPoint = CGPointMake(160, 110);
    CGContextDrawLinearGradient(currentContext1, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    CGContextRestoreGState(currentContext1);
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGRect someRect = CGRectMake(bounds.size.width / 4.0, bounds.size.height / 4.0, bounds.size.width / 2.0, bounds.size.height / 2.0);
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4,7), 3);
    [logoImage drawInRect:someRect];
    CGContextRestoreGState(currentContext);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Moveddddd.");
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Cancled!!");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%@ was touched",self);
    float red = (arc4random() % 100) /100.0;
    float green = (arc4random() % 100) /100.0;
    float blue = (arc4random() % 100) /100.0;
    NSLog(@"red = %f, green = %f, blue = %f",red,green,blue);
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    NSLog(@"END!!!!!!!!!!");
}
@end
