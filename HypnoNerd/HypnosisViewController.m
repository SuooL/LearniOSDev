//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by 胡振生 on 15/11/29.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@interface HypnosisViewController () <UITextFieldDelegate>

@end

@implementation HypnosisViewController 
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnosis";
        UIImage *img = [UIImage imageNamed:@"Hypno"];
        self.tabBarItem.image = img;
    }
    
    return self;
}

- (void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    HypnosisView *backgroundView = [[HypnosisView alloc] initWithFrame:frame];
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc]initWithFrame:textFieldRect];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnosis me.";
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    [backgroundView addSubview:textField];
    // Set it as *the* view of this view controller
    self.view = backgroundView;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    return YES;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Hyponsis Load Done!");
}

- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        // Configure the label's colors and text
        messageLabel.backgroundColor = [UIColor greenColor];
        messageLabel.textColor = [UIColor blueColor];
        messageLabel.text = message;
        
        // This method resizes the label, which will be relative
        // to the text that it is displaying
        [messageLabel sizeToFit];
        
        // Get a random x value that fits within the hypnosis view's width
        int width = self.view.bounds.size.width - messageLabel.bounds.size.width;
        int x = arc4random_uniform(width);
        
        // Get a random y value that fits within the hypnosis view's height
        int height = self.view.bounds.size.height - messageLabel.bounds.size.height;
        int y = arc4random_uniform(height);
        
        // Update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        // Add the label to the hierarchy
        [self.view addSubview:messageLabel];
        
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @-45;
        motionEffect.maximumRelativeValue = @45;
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @-45;
        motionEffect.maximumRelativeValue = @45;
        [messageLabel addMotionEffect:motionEffect];
    }
}
@end
