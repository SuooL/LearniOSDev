//
//  AppDelegate.m
//  Chapter4-concentricCircles
//
//  Created by 胡振生 on 15/11/28.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import "AppDelegate.h"
#import "HypnosisView.h"

@interface AppDelegate () <UIScrollViewDelegate>
@property (strong,nonatomic) HypnosisView *hypnosisView;
@property CGRect screenRec;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIViewController *rootViewController = [[UIViewController alloc]init];
    [self.window setRootViewController:rootViewController];
    _screenRec = self.window.bounds;
    CGRect bigRect = _screenRec;
    bigRect.size.width *= 2.0;
    bigRect.size.height *= 2.0;
    
    // Create a screen-sized scroll view and add it to the window
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:_screenRec];
    scrollView.delegate = self;
    scrollView.maximumZoomScale = 2.0;
    scrollView.minimumZoomScale = 1.0;
    [rootViewController.view addSubview:scrollView];
    
    // Create a screen-sized hypnosis view and add it to the scroll view
    _hypnosisView = [[HypnosisView alloc] initWithFrame:bigRect];
    [scrollView addSubview:_hypnosisView];
    
    // Add a second screen-sized hypnosis view just off screen to the right
//    screenRect.origin.x = screenRect.size.width;
//    HypnosisView *anotherView = [[HypnosisView alloc] initWithFrame:screenRect];
//    [scrollView addSubview:anotherView];

    [scrollView setPagingEnabled:NO];
    
    CGRect scrollRect = bigRect;
    scrollRect.size.width *= 4;
    scrollView.contentSize = scrollRect.size;
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _hypnosisView;
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    // [view setBounds:CGRectMake(0, 0, _screenRec.size.width, _screenRec.size.height)];
}

@end
