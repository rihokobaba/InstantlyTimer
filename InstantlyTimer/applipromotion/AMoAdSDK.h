//
//  AppliPromotionSDK
//
//  Copyright © CyberAgent, Inc. All Rights Reserved.
//

#import <UIKit/UIKit.h>


@interface AMoAdSDK : NSObject {
}

/*
 * Wallの表示.
 */
+ (UIViewController *) showAppliPromotionWall:(UIViewController *)owner;
+ (UIViewController *) showAppliPromotionWall:(UIViewController *)owner trigger:(NSString *)trigger;
+ (UIViewController *) showAppliPromotionWall:(UIViewController *)owner
                                  orientation:(UIInterfaceOrientation)orientation;
+ (UIViewController *) showAppliPromotionWall:(UIViewController *)owner
                                  orientation:(UIInterfaceOrientation)orientation
                                      trigger:(NSString *)trigger;


/*
 * Wallの表示が初めてかどうかのチェック.
 */
+ (BOOL)isFirstTimeInToday;

/*
 * UUIDの送信.
 */
+ (void)sendUUID;

/*
 * TriggerIDの送信.
 */
+ (void)sendTriggerID;
+ (void)sendTriggerID:(NSString *)TriggerID;

/*
 * インタースティシャル広告設定の取得.
 */
+ (void)loadInterstitial:(UIViewController *)owner;

/*
 * インタースティシャル広告の表示.
 */
+ (void)showInterstitial:(UIViewController *)owner;
+ (void)showInterstitial:(UIViewController *)owner forced:(BOOL)forced;
+ (void)showInterstitial:(UIViewController *)owner callback:(SEL)callback;
+ (void)showInterstitial:(UIViewController *)owner forced:(BOOL)forced callback:(SEL)callback;
+ (void)setInterstitialDelegate:(id)delegate;

@end
