//
//  ReminderViewController.m
//  HypnoNerd
//
//  Created by 胡振生 on 15/11/29.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import "ReminderViewController.h"

@interface ReminderViewController()
@property (nonatomic,weak) IBOutlet UIDatePicker *datePicker;
@end

@implementation ReminderViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = self.tabBarItem;
        tbi.title = @"Reminder";
        UIImage *img = [UIImage imageNamed:@"Time"];
        tbi.image = img;
    }
    
    return  self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"ReminderView Load Done!");
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

-(IBAction)addReminder :(id)sender
{
    NSDate *date = self.datePicker.date;
    
    NSLog(@"newDate----%@",date);  // 此时间格式不对，差了8个小时，但是通知依然推送成功。

    UILocalNotification *note = [[UILocalNotification alloc] init];
    NSString *strNoti = [NSString stringWithFormat:@"Hypnotize me on %@", date];
    note.alertBody = strNoti;
    note.fireDate = date;
    UIApplication *application = [UIApplication sharedApplication];
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert categories:nil];
    [application registerUserNotificationSettings:settings];
    [application scheduleLocalNotification:note];}

@end
