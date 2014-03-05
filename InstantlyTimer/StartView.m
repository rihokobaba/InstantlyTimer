//
//  StartView.m
//  InstantlyTimer
//
//  Created by aiharakohei on 2014/02/19.
//  Copyright (c) 2014年 aiharakohei. All rights reserved.
//

#import "StartView.h"
#import "MainViewController.h"

@implementation StartView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    MainViewController *viewcontroller =  (MainViewController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    
    UIImage *satartImg = [UIImage imageNamed:@"start.png"];  // ボタンにする画像を生成する
    UIButton *startBtn = [[UIButton alloc]
                      initWithFrame:CGRectMake(110, 254, 100, 100)];  // ボタンのサイズを指定する
    [startBtn setBackgroundImage:satartImg forState:UIControlStateNormal];  // 画像をセットする
    // ボタンが押された時にhogeメソッドを呼び出す
    [startBtn addTarget:viewcontroller
            action:@selector(pressStart:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:startBtn];
    
    UIImage *pattern1Img = [UIImage imageNamed:@"1.png"];  // ボタンにする画像を生成する
    UIButton *pattern1Btn = [[UIButton alloc]
                          initWithFrame:CGRectMake(28, 435, 89, 23)];  // ボタンのサイズを指定する
    [pattern1Btn setBackgroundImage:pattern1Img forState:UIControlStateNormal];  // 画像をセットする
    // ボタンが押された時にhogeメソッドを呼び出す
    [pattern1Btn addTarget:self
                 action:@selector(pressPattern:) forControlEvents:UIControlEventTouchUpInside];
    [pattern1Btn setTag:1];
    [self addSubview:pattern1Btn];
    
    UIImage *pattern2Img = [UIImage imageNamed:@"2.png"];  // ボタンにする画像を生成する
    UIButton *pattern2Btn = [[UIButton alloc]
                             initWithFrame:CGRectMake(116, 435, 89, 23)];  // ボタンのサイズを指定する
    [pattern2Btn setBackgroundImage:pattern2Img forState:UIControlStateNormal];  // 画像をセットする
    // ボタンが押された時にhogeメソッドを呼び出す
    [pattern2Btn addTarget:self
                    action:@selector(pressPattern:) forControlEvents:UIControlEventTouchUpInside];
    [pattern2Btn setTag:2];
    [self addSubview:pattern2Btn];
    
    UIImage *pattern3Img = [UIImage imageNamed:@"3.png"];  // ボタンにする画像を生成する
    UIButton *pattern3Btn = [[UIButton alloc]
                             initWithFrame:CGRectMake(204, 435, 89, 23)];  // ボタンのサイズを指定する
    [pattern3Btn setBackgroundImage:pattern3Img forState:UIControlStateNormal];  // 画像をセットする
    // ボタンが押された時にhogeメソッドを呼び出す
    [pattern3Btn addTarget:self
                    action:@selector(pressPattern:) forControlEvents:UIControlEventTouchUpInside];
    [pattern3Btn setTag:3];
    [self addSubview:pattern3Btn];
    
    NSNumber *patternNum = (NSNumber*)[[NSUserDefaults standardUserDefaults]objectForKey:@"currentPattern"];
    int num = [patternNum intValue];
    NSNumber *minute = [[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"pattern%dMinute",num]];
    NSNumber *second = [[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"pattern%dSecond",num]];

    
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



-(void)pressPattern:(id)sender{
    UIButton *btn = (UIButton*)sender;
    int patternNum = (int)[btn tag];
    NSNumber *minute = [[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"pattern%dMinute",patternNum]];
    NSNumber *second = [[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"pattern%dSecond",patternNum]];
    timeLabel.text = [NSString stringWithFormat:@"%02d:%02d", [minute intValue], [second intValue]];
    
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInt:patternNum] forKey:@"currentPattern"];
    
}

@end
