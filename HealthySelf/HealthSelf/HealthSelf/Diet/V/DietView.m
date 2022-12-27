//
//  VIewDiet.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import "DietView.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@implementation DietView
- (void)viewInit {
    self.backgroundColor = [UIColor whiteColor];
    UIColor *labelGreen = [UIColor colorWithRed:124 / 255.0f green:193 / 255.0f blue:156 / 255.0f alpha:1.0];
#pragma mark Label
    UIColor *labelGreen2 = [UIColor colorWithRed:235 / 255.0f green:255 / 255.0f blue:240 / 255.0f alpha:1.0];
    self.backView = [[UIView alloc] init];
    self.backView.backgroundColor = labelGreen2;
    [self addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(ScreenWidth / 2 - 20));
        make.height.equalTo(@43);
        make.left.equalTo(@105);
        make.top.equalTo(@70);
    }];
    self.backView.layer.masksToBounds = YES;
    self.backView.layer.cornerRadius = 20.0;
    
    self.labelHealth = [[UILabel alloc] init];
    self.labelHealth.text = @"Healthy Diet";
    self.labelHealth.textColor = labelGreen;
    /**
     关于字体斜体的设置- 我测试了好半天才发现只有英语能设置斜体等字体- 坑啊 Helvetica-BoldOblique
     Zapfino 花体 Georgia-BoldItalic
     */
    self.labelHealth.font = [UIFont fontWithName:@"TimesNewRomanPs-BoldItalicMT" size:25];
    self.labelHealth.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.labelHealth];
    [self.labelHealth mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@65);
        make.left.equalTo(@-2);
        make.height.equalTo(@50);
        make.width.equalTo(@(ScreenWidth));
     }];
#pragma mark SearchFoodText
    //查询框
    UIColor *newGreen2 = [UIColor colorWithRed:135 / 255.0f green:211 / 255.0f blue:174 / 255.0f alpha:1.0];
    self.SearchTextFiled = [[UITextField alloc] init];
    self.SearchTextFiled.placeholder = @"搜索食物热量和营养";
    self.SearchTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    self.SearchTextFiled.keyboardType = UIKeyboardTypeURL;
    self.SearchTextFiled.layer.masksToBounds = YES;
    self.SearchTextFiled.layer.cornerRadius = 18.0;
    self.SearchTextFiled.layer.borderWidth = 2.0;
    self.SearchTextFiled.layer.borderColor = newGreen2.CGColor;
    // 输入框的图片
    self.searchImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sousuo-2.png"]];
    self.SearchTextFiled.leftViewMode = UITextFieldViewModeAlways;
    self.SearchTextFiled.leftView = self.searchImageView;
    // textField协议
    self.SearchTextFiled.delegate = self;
    
    [self addSubview: self.SearchTextFiled];
    [self addSubview: self.searchImageView];
    [self. self.SearchTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@25);
        make.height.equalTo(@40);
        make.width.equalTo(@(ScreenWidth - 40));
        make.top.equalTo([self.backView mas_bottom]).offset(30);
    }];
    [self.searchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@21);
        make.width.equalTo(@21);
    }];
}
#pragma mark SearchFood

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    /*注册通知并发送*/
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ToSearchFoodView" object:nil userInfo:nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
