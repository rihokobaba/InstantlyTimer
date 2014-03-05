//
//  ViewController.h
//  InstantlyTimer
//
//  Created by aiharakohei on 2014/02/18.
//  Copyright (c) 2014年 aiharakohei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingView.h"
#import "TimerView.h"
#import "StartView.h"


@interface MainViewController : UIViewController
{
    StartView *startView;
    TimerView *timerView;
    SettingView *settingView;
    
    NSTimer *tm;
    
}

@property BOOL isTimerRunning;
@property int minute;
@property int second;

-(void)pressCancel:(id)sender;

@end
