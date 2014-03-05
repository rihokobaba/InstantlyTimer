//
//  SettingView.m
//  InstantlyTimer
//
//  Created by aiharakohei on 2014/02/19.
//  Copyright (c) 2014年 aiharakohei. All rights reserved.
//

#import "SettingView.h"
#import "MainViewController.h"

@implementation SettingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    // UIPickerのインスタンス化
    UIPickerView *picker = [[UIPickerView alloc]init];
    
    // デリゲートを設定
    picker.delegate = self;
    
    // データソースを設定
    picker.dataSource = self;
    
    // 選択インジケータを表示
    picker.showsSelectionIndicator = YES;
    
    // UIPickerのインスタンスをビューに追加
    
    [self addSubview:picker];
    
    MainViewController *viewcontroller =  (MainViewController*)[UIApplication sharedApplication].keyWindow.rootViewController;

    
    UIImage *pattern1Img = [UIImage imageNamed:@"1.png"];  // ボタンにする画像を生成する
    UIButton *pattern1Btn = [[UIButton alloc]
                             initWithFrame:CGRectMake(22, 318, 92, 25)];  // ボタンのサイズを指定する
    [pattern1Btn setBackgroundImage:pattern1Img forState:UIControlStateNormal];  // 画像をセットする
    // ボタンが押された時にhogeメソッドを呼び出す
    [pattern1Btn addTarget:self
                    action:@selector(pressPattern:) forControlEvents:UIControlEventTouchUpInside];
    [pattern1Btn setTag:1];
    [self addSubview:pattern1Btn];
    
    UIImage *pattern2Img = [UIImage imageNamed:@"2.png"];  // ボタンにする画像を生成する
    UIButton *pattern2Btn = [[UIButton alloc]
                             initWithFrame:CGRectMake(113, 318, 92, 25)];  // ボタンのサイズを指定する
    [pattern2Btn setBackgroundImage:pattern2Img forState:UIControlStateNormal];  // 画像をセットする
    // ボタンが押された時にhogeメソッドを呼び出す
    [pattern2Btn addTarget:self
                    action:@selector(pressPattern:) forControlEvents:UIControlEventTouchUpInside];
    [pattern2Btn setTag:2];
    [self addSubview:pattern2Btn];
    
    UIImage *pattern3Img = [UIImage imageNamed:@"3.png"];  // ボタンにする画像を生成する
    UIButton *pattern3Btn = [[UIButton alloc]
                             initWithFrame:CGRectMake(207, 318, 92, 25)];  // ボタンのサイズを指定する
    [pattern3Btn setBackgroundImage:pattern3Img forState:UIControlStateNormal];  // 画像をセットする
    // ボタンが押された時にhogeメソッドを呼び出す
    [pattern3Btn addTarget:self
                    action:@selector(pressPattern:) forControlEvents:UIControlEventTouchUpInside];
    [pattern3Btn setTag:3];
    [self addSubview:pattern3Btn];
    
    UIImage *storeImg = [UIImage imageNamed:@"store.png"];  // ボタンにする画像を生成する
    UIButton *storeBtn = [[UIButton alloc]
                             initWithFrame:CGRectMake(115, 395, 90, 90)];  // ボタンのサイズを指定する
    [storeBtn setBackgroundImage:storeImg forState:UIControlStateNormal];  // 画像をセットする
    // ボタンが押された時にhogeメソッドを呼び出す
    [storeBtn addTarget:self
                    action:@selector(pressStore:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:storeBtn];
    
    
    UIImage *backImg = [UIImage imageNamed:@"back.png"];  // ボタンにする画像を生成する
    UIButton *backBtn = [[UIButton alloc]
                          initWithFrame:CGRectMake(200, 395, 90, 90)];  // ボタンのサイズを指定する
    [backBtn setBackgroundImage:backImg forState:UIControlStateNormal];  // 画像をセットする
    // ボタンが押された時にhogeメソッドを呼び出す
    [backBtn addTarget:viewcontroller
                 action:@selector(pressBack:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backBtn];
    
    return self;

}

/**
 * ピッカーに表示する列数を返す
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

/**
 * ピッカーに表示する行数を返す
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return 60;
}

/**
 * 行のサイズを変更
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component
{
    switch (component) {
        case 0: // 1列目
            return 50.0;
            break;
            
        case 1: // 2列目
            return 50.0;
            break;
            
            
        default:
            return 0;
            break;
    }
}

/**
 * ピッカーに表示する値を返す
 */
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 0: // 1列目
            return [NSString stringWithFormat:@"%ld", row];
            break;
            
        case 1: // 2列目
            return [NSString stringWithFormat:@"%ld", row];
            break;
            
        default:
            return 0;
            break;
    }
}

/**
 * ピッカーの選択行が決まったとき
 */
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // 1列目の選択された行数を取得
    minute = [pickerView selectedRowInComponent:0];
    
    // 2列目の選択された行数を取得
    second = [pickerView selectedRowInComponent:1];
    
}

-(void)pressPattern:(id)sender{
    UIButton *btn = (UIButton*)sender;
    patternNum = (int)[btn tag];
}

-(void)pressStore:(id)sender{
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInteger:minute] forKey:[NSString stringWithFormat:@"pattern%dMinute",patternNum]];
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInteger:second] forKey:[NSString stringWithFormat:@"pattern%dSecond",patternNum]];

    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"" message:@"保存しました"
                              delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
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
