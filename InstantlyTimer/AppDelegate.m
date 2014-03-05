//
//  AppDelegate.m
//  InstantlyTimer
//
//  Created by aiharakohei on 2014/02/18.
//  Copyright (c) 2014年 aiharakohei. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
//#import "AMoAdSDK.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //各パターン初期値
    NSDateComponents *patttern = [[NSDateComponents alloc]init];
    [patttern setMinute:1];
    [patttern setSecond:0];
    
    if (patttern) {
        NSLog(@"nsdate nothing");
    }
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
    
    
    //初期値に保存
    [defaults setObject:[NSNumber numberWithInt:1]  forKey:@"pattern1Minute"];
    [defaults setObject:[NSNumber numberWithInt:0] forKey:@"pattern1Second"];
    [defaults setObject:[NSNumber numberWithInt:1]  forKey:@"pattern2Minute"];
    [defaults setObject:[NSNumber numberWithInt:0] forKey:@"pattern2Second"];
    [defaults setObject:[NSNumber numberWithInt:1]  forKey:@"pattern3Minute"];
    [defaults setObject:[NSNumber numberWithInt:0] forKey:@"pattern3Second"];
    [defaults setObject:[NSNumber numberWithInt:1] forKey:@"currentPattern"];
    [ud registerDefaults:defaults];
    
    
    //初期ViewController
    MainViewController *vc = [[MainViewController alloc] initWithNibName:nil bundle:nil];
    [self.window setRootViewController:vc];
    // Override point for customization after application launch.
    
    // アプリプロモーション
//    [AMoAdSDK sendUUID];
    
    // バッジ、サウンド、アラートをリモート通知対象として登録する
    // (画面にはプッシュ通知許可して良いかの確認画面が出る)
    [application registerForRemoteNotificationTypes: (UIRemoteNotificationTypeBadge|
                                                      UIRemoteNotificationTypeSound|
                                                      UIRemoteNotificationTypeAlert)];
    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

    MainViewController *mainVC = (MainViewController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    if (mainVC.isTimerRunning) {
        prevRunDate = [NSDate date];
        
        // １：UILocalNotificationインスタンスを生成する。
        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
        if(localNotification == nil) {
            return;
        }
        
        // ２：いつ通知するか、何を表示するかのプロパティをセットする。
        
        NSInteger minutes = mainVC.minute * 60 + mainVC.second;
        NSDate *fireDate = [[NSDate alloc] initWithTimeInterval:minutes sinceDate:[NSDate date]];
        
        localNotification.fireDate = fireDate;
        localNotification.timeZone = [NSTimeZone localTimeZone];
        
        localNotification.alertAction = @"title of notification";
        localNotification.alertBody = @"message of notification";
        
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification.applicationIconBadgeNumber = 1;
        
        // ３：アプリケーションに登録する。
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    MainViewController *mainVC = (MainViewController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    if (mainVC.isTimerRunning) {
        [[UIApplication sharedApplication]cancelAllLocalNotifications];
        
        NSDate *currentDate = [NSDate date];
        float differenceTime = [currentDate timeIntervalSinceDate:prevRunDate];
        if (differenceTime > mainVC.minute * 60 + mainVC.second) {
//            [mainVC pressCancel:nil];
            MainViewController *vc = [[MainViewController alloc] initWithNibName:nil bundle:nil];
            [self.window setRootViewController:vc];
        }
    }
    
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // デバイストークンの両端の「<>」を取り除く
    NSString *deviceTokenString = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    
    // デバイストークン中の半角スペースを除去する
    deviceTokenString = [deviceTokenString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(@"%@",deviceTokenString);
}

// プッシュ通知を受信した際の処理
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
//#if !TARGET_IPHONE_SIMULATOR
    NSLog(@"remote notification: %@",[userInfo description]);
//    NSDictionary *apsInfo = [userInfo objectForKey:@"aps"];
//    
//    NSString *alert = [apsInfo objectForKey:@"alert"];
//    NSLog(@"Received Push Alert: %@", alert);
//    
//    NSString *sound = [apsInfo objectForKey:@"sound"];
//    NSLog(@"Received Push Sound: %@", sound);
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//    
//    NSString *badge = [apsInfo objectForKey:@"badge"];
//    NSLog(@"Received Push Badge: %@", badge);
//    application.applicationIconBadgeNumber = [[apsInfo objectForKey:@"badge"] integerValue];
//#endif
}

@end
