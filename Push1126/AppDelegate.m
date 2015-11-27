//
//  AppDelegate.m
//  Push1126
//
//  Created by 劉坤昶 on 2015/11/26.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeTVC.h"


#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate




-(void)start
{
    
    HomeTVC *homePage = [[HomeTVC alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homePage];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = homeNav;
    [self.window makeKeyAndVisible];

    
    
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    HomeTVC *homePage = [[HomeTVC alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homePage];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = homeNav;
    [self.window makeKeyAndVisible];
    
    
    
    [Parse setApplicationId:@"1AoMLPa5EtqwpWuqdpYMgW0FH5kC3boDH0aLjU2h" clientKey:@"BkDbKsKdXcnwrNle4JHoOVuzeOWOaib0Ku1lHgX6"];

    
    UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                    UIUserNotificationTypeBadge |
                                                    UIUserNotificationTypeSound);
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                             categories:nil];
    [application registerUserNotificationSettings:settings];
    [application registerForRemoteNotifications];

    
    
    return YES;
}




- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    
    //currentInstallation.channels = @[ @"global" ];

    
    [currentInstallation saveInBackground];
}



- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [PFPush handlePush:userInfo];

    [self start];

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

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    ////開啟app後 讓bagde number消失歸零
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    if (currentInstallation.badge != 0) {
        currentInstallation.badge = 0;
        [currentInstallation saveEventually];
    }


}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
