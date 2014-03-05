//
//  ViewController.m
//  InstantlyTimer
//
//  Created by aiharakohei on 2014/02/18.
//  Copyright (c) 2014年 aiharakohei. All rights reserved.
//

#import "MainViewController.h"
//#import "AMoAdSDK.h"


@interface MainViewController ()

@end

@implementation MainViewController

@synthesize isTimerRunning;
@synthesize minute;
@synthesize second;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    settingView = [[SettingView alloc]initWithFrame:CGRectMake(320, 0, 320, 568)];
    [settingView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:settingView];
    
    startView = [[StartView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    [startView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:startView];
    
    timerView = [[TimerView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    [timerView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:timerView];
    
   
    
    
    [self startTimer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pressStart:(id)sender{
    [startView setHidden:YES];
    [timerView setHidden:NO];
    
    [self startTimer];
}

-(void)startTimer{
    self.isTimerRunning = YES;
    
    NSNumber *patternNum = (NSNumber*)[[NSUserDefaults standardUserDefaults]objectForKey:@"currentPattern"];
    self.minute = [[[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"pattern%dMinute",[patternNum intValue]]]intValue];
    self.second = [[[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"pattern%dSecond",[patternNum intValue]]]intValue];
    
    timerView.timeLabel.text = [NSString stringWithFormat:@"%02d:%02d", self.minute,self.second ];
    
    
    tm =[NSTimer scheduledTimerWithTimeInterval:1.0f
                                         target:self
                                       selector:@selector(countDwon:)
                                       userInfo:nil
                                        repeats:YES
         ];
}

-(void)pressResume:(id)sender{
    if ([tm isValid]) {
        [tm invalidate];
        self.isTimerRunning = NO;

    } else {
        tm =[NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(countDwon:)
                                           userInfo:nil
                                            repeats:YES
             ];
    }
}

-(void)pressCancel:(id)sender{
    [startView setHidden:NO];
    [timerView setHidden:YES];
    
    self.isTimerRunning = NO;

    [tm invalidate];
}

-(void)pressMoreApp:(id)sender{
//    [AMoAdSDK showAppliPromotionWall:self];

}

-(void)pressSetting:(id)sender{
    [UIView animateWithDuration:1.0f
                     animations:^{
                         // アニメーションをする処理
                         self.view.bounds = CGRectMake(320, 0, 320, 568);
                     }];
}
-(void)pressBack:(id)sender{
    [UIView animateWithDuration:1.0f
                     animations:^{
                         // アニメーションをする処理
                         self.view.bounds = CGRectMake(0, 0, 320, 568);
                     }];
}

-(void)countDwon:(NSTimer*)timer{
    if (self.second == 0) {
        self.second = 59;
        self.minute--;
    } else {
        self.second--;
    }
    if (self.second == 0 && self.minute == 0) {
        [timer invalidate];
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"" message:@"タイマー終了"
                                  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    timerView.timeLabel.text = [NSString stringWithFormat:@"%02d:%02d", self.minute,self.second ];

}


@end
