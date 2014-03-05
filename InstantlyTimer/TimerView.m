//
//  TimerView.m
//  InstantlyTimer
//
//  Created by aiharakohei on 2014/02/19.
//  Copyright (c) 2014年 aiharakohei. All rights reserved.
//

#import "TimerView.h"
#import "MainViewController.h"

@implementation TimerView

@synthesize timeLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    MainViewController *viewcontroller =  (MainViewController*)[UIApplication sharedApplication].keyWindow.rootViewController;

    
    UIImage *resumeImg = [UIImage imageNamed:@"resume.png"];  // ボタンにする画像を生成する
    UIButton *resumeBtn = [[UIButton alloc]
                          initWithFrame:CGRectMake(190, 254, 98, 98)];  // ボタンのサイズを指定する
    [resumeBtn setBackgroundImage:resumeImg forState:UIControlStateNormal];  // 画像をセットする
    // resumeBtnが押された時にhogeメソッドを呼び出す
    [resumeBtn addTarget:viewcontroller
                 action:@selector(pressResume:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:resumeBtn];
   
    
    
    UIImage *canselImg = [UIImage imageNamed:@"cansel.png"];  // ボタンにする画像を生成する
    UIButton *canselBtn = [[UIButton alloc]
                           initWithFrame:CGRectMake(34, 254, 98, 98)];  // ボタンのサイズを指定する
    [canselBtn setBackgroundImage:canselImg forState:UIControlStateNormal];  // 画像をセットする
    // resumeBtnが押された時にhogeメソッドを呼び出す
    [canselBtn addTarget:viewcontroller
                  action:@selector(pressCancel:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:canselBtn];
    
    
    UIImage *moreappImg = [UIImage imageNamed:@"moreapp.png"];  // ボタンにする画像を生成する
    UIButton *moreappBtn = [[UIButton alloc]
                           initWithFrame:CGRectMake(121, 378, 78, 78)];  // ボタンのサイズを指定する
    [moreappBtn setBackgroundImage:moreappImg forState:UIControlStateNormal];  // 画像をセットする
    // resumeBtnが押された時にhogeメソッドを呼び出す
    [moreappBtn addTarget:viewcontroller
                  action:@selector(pressMoreApp:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:moreappBtn];
    
    UIImage *settingImg = [UIImage imageNamed:@"setting.png"];  // ボタンにする画像を生成する
    UIButton *settingBtn = [[UIButton alloc]
                            initWithFrame:CGRectMake(200, 378, 78, 78)];  // ボタンのサイズを指定する
    [settingBtn setBackgroundImage:settingImg forState:UIControlStateNormal];  // 画像をセットする
    // resumeBtnが押された時にhogeメソッドを呼び出す
    [settingBtn addTarget:viewcontroller
                   action:@selector(pressSetting:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:settingBtn];
    
    NSNumber *minute = [[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"pattern1Minute"]];
    NSNumber *second = [[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"pattern1Second"]];
    
    
    timeLabel = [[UILabel alloc]init];
    timeLabel.text = [NSString stringWithFormat:@"%02d:%02d", [minute intValue], [second intValue]];
    timeLabel.frame =  CGRectMake(39, 87, 242, 115);
    UIFont *font = [UIFont systemFontOfSize:90];
    timeLabel.font = font;
    [self addSubview:timeLabel];

    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
