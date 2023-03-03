//
//  ViewRegister.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/5.
//

#import "RegisterView.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface RegisterView()
@property (nonatomic, strong) UIImageView *lightImageView;
@property (nonatomic, strong) UIButton *readButton;
@property (nonatomic, strong) UILabel *readLabel;
@end
@implementation RegisterView
- (void)viewInit {
    UIColor *newGreen = [UIColor colorWithRed:30 / 255.0f green:183 / 255.0f blue:131 / 255.0f alpha:1.0];
    UIColor *newGreen2 = [UIColor colorWithRed:69 / 255.0f green:113 / 255.0f blue:81 / 255.0f alpha:1.0];
    UIColor *newBackGreen = [UIColor colorWithRed:20 / 255.0f green:220 / 255.0f blue:150 / 255.0f alpha:1.0];
    self.backgroundColor = newBackGreen;
#pragma mark TELNumber
    //手机号
    self.textFieldTelNumber = [[UITextField alloc] init];
    self.textFieldTelNumber .placeholder = @"请输入手机号                               +86";
    self.textFieldTelNumber .borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldTelNumber .keyboardType = UIKeyboardTypeURL;
    self.textFieldTelNumber .layer.cornerRadius = 16.0;
    self.textFieldTelNumber .layer.borderWidth = 0.5;
    self.textFieldTelNumber.layer.masksToBounds = YES;
    self.textFieldTelNumber .layer.borderColor = newGreen2.CGColor;
    // 输入框的图片
    self.imageViewPassWord  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shoujihao.png"]];
    self.textFieldTelNumber .leftViewMode = UITextFieldViewModeAlways;
    self.textFieldTelNumber .leftView = self.imageViewPassWord;
    // textField协议
    self.textFieldTelNumber .delegate = self;
    
    [self addSubview:self.textFieldTelNumber];
    [self addSubview:self.imageViewPassWord];
    [self.imageViewPassWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@26);
        make.width.equalTo(@26);
    }];
    [self.textFieldTelNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(ScreenWidth / 8 - 10));
        make.height.equalTo(@40);
        make.width.equalTo(@(ScreenWidth / 4 * 3 +20));
        make.top.equalTo(@(ScreenHeight / 2 - 200));
    }];
    
    
    self.lightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LightTime.png"]];
    [self addSubview:self.lightImageView];
    [self.lightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.textFieldTelNumber).offset(-15);
        make.left.equalTo(@(ScreenWidth / 2 - 120));
        make.width.equalTo(@240);
        make.height.equalTo(@240);
        
    }];
#pragma mark VerificationCode
    //验证码
    self.textFieldVerificationCode = [[UITextField alloc] init];
    self.textFieldVerificationCode .placeholder = @"输入验证码";
    self.textFieldVerificationCode .borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldVerificationCode .keyboardType = UIKeyboardTypeURL;
    self.textFieldVerificationCode.layer.masksToBounds = YES;
    self.textFieldVerificationCode .layer.cornerRadius = 16.0;
    self.textFieldVerificationCode.layer.borderWidth = 0.5;
    self.textFieldVerificationCode.layer.borderColor = newGreen2.CGColor;
    // textField协议
    self.textFieldVerificationCode.delegate = self;
    
    [self addSubview:self.textFieldVerificationCode];
    [self.textFieldVerificationCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(ScreenWidth / 8 - 10));
        make.height.equalTo(@35);
        make.width.equalTo(@(ScreenWidth / 2));
        make.top.equalTo(self.textFieldTelNumber).offset(70);
    }];
#pragma mark buttonVerificationCode
    self.buttonSendVerificationCode = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.buttonSendVerificationCode setTitle:@"发送验证码" forState:UIControlStateNormal];
    self.buttonSendVerificationCode.titleLabel.font = [UIFont systemFontOfSize:18];
    self.buttonSendVerificationCode.layer.masksToBounds = YES;
    self.buttonSendVerificationCode.layer.cornerRadius = 14;
    self.buttonSendVerificationCode.layer.borderWidth = 0.5;
    self.buttonSendVerificationCode.tintColor = [UIColor whiteColor];
    self.buttonSendVerificationCode.layer.borderColor = [UIColor grayColor].CGColor;
    self.buttonSendVerificationCode.backgroundColor = newGreen;
    self.buttonSendVerificationCode.tag = 0;
    [self.buttonSendVerificationCode addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.buttonSendVerificationCode];
    [self.buttonSendVerificationCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textFieldTelNumber).offset(73);
        make.left.equalTo(self.textFieldVerificationCode.mas_right).offset (10);
        make.width.equalTo(@107);
        make.height.equalTo(@30);
    }];
#pragma mark PassWord
    //密码
    self.textFieldPassWord = [[UITextField alloc] init];
    self.textFieldPassWord.placeholder = @"请输入密码";
    self.textFieldPassWord.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldPassWord.keyboardType = UIKeyboardTypeURL;
    self.textFieldPassWord.layer.masksToBounds = YES;
    self.textFieldPassWord.layer.cornerRadius = 16.0;
    self.textFieldPassWord.layer.borderWidth = 0.5;
    self.textFieldPassWord.layer.borderColor = newGreen2.CGColor;
    // 输入框的图片
    self.imageViewPassWord = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"weibiaoti--.png"]];
    self.textFieldPassWord.leftViewMode = UITextFieldViewModeAlways;
    self.textFieldPassWord.leftView = self.imageViewPassWord;
    self.textFieldPassWord.secureTextEntry = YES;
    // textField协议
    self.textFieldPassWord.delegate = self;
    [self addSubview:self.textFieldPassWord];
    [self addSubview:self.imageViewPassWord];
    [self.imageViewPassWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@25);
        make.width.equalTo(@25);
    }];
    [self.textFieldPassWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(ScreenWidth / 8 - 10));
        make.height.equalTo(@35);
        make.width.equalTo(@(ScreenWidth / 3 * 2));
        make.top.equalTo(self.textFieldVerificationCode).offset(60);
    }];
#pragma mark SurePassWord
    //密码
    self.textFieldSurePassWord = [[UITextField alloc] init];
    self.textFieldSurePassWord .placeholder = @"请再次确认密码";
    self.textFieldSurePassWord .borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldSurePassWord .keyboardType = UIKeyboardTypeURL;
    self.textFieldSurePassWord .layer.masksToBounds = YES;
    self.textFieldSurePassWord .layer.cornerRadius = 18.0;
    self.textFieldSurePassWord .layer.borderWidth = 0.5;
    self.textFieldSurePassWord .layer.borderColor = newGreen2.CGColor;
        // 输入框的图片
    self.imageViewPassWord  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"weibiaoti--.png"]];
    self.textFieldSurePassWord .leftViewMode = UITextFieldViewModeAlways;
    self.textFieldSurePassWord .leftView = self.imageViewPassWord;
    self.textFieldSurePassWord .secureTextEntry = YES;
        // textField协议
    self.textFieldSurePassWord .delegate = self;
    
    [self addSubview:self.textFieldSurePassWord];
    [self addSubview:self.imageViewPassWord];
    [self.imageViewPassWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@25);
        make.width.equalTo(@25);
    }];
    [self.textFieldSurePassWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(ScreenWidth / 8 - 10));
        make.height.equalTo(@35);
        make.width.equalTo(@(ScreenWidth / 3 * 2));
        make.top.equalTo(self.textFieldPassWord).offset(55);
    }];
#pragma mark ButtonRegister
    self.buttontRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.buttontRegister setTitle:@"一键注册" forState:UIControlStateNormal];
    self.buttontRegister.titleLabel.font = [UIFont systemFontOfSize:18];
    self.buttontRegister.layer.masksToBounds = YES;
    self.buttontRegister.layer.cornerRadius = 16;
    self.buttontRegister.layer.borderWidth = 0.5;
    self.buttontRegister.tintColor = [UIColor whiteColor];
    self.buttontRegister.layer.borderColor = [UIColor grayColor].CGColor;
    self.buttontRegister.backgroundColor = newGreen;
    self.buttontRegister.tag = 1;
    [self.buttontRegister addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.buttontRegister];
    [self.buttontRegister mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textFieldSurePassWord).offset(75);
        make.left.equalTo(@20);
        make.width.equalTo(@(ScreenWidth - 40));
        make.height.equalTo(@36);
    }];
    
    self.readButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.readButton.tag = 120;
    [self.readButton setImage:[UIImage imageNamed:@"weixuan.png"] forState:UIControlStateNormal];
    [self.readButton addTarget:self action:@selector(seleMeth:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.readButton];
    [self.readButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.buttontRegister mas_bottom]).offset(18.5);
        make.left.equalTo(@46);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    
    self.readLabel = [[UILabel alloc] init];
    self.readLabel.text = @"我已阅读并同意服务协议和隐私保护指引";
    self.readLabel.textColor = [UIColor whiteColor];
    self.readLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    [self addSubview:self.readLabel];
    [self.readLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo([self.readButton mas_right]).offset(3);
        make.top.equalTo([self.buttontRegister mas_bottom]).offset(20);
    }];
    
}

#pragma mark TextFieldDelegateMEthod
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //回收键盘对象
    [self.textFieldPassWord resignFirstResponder];
    [self.textFieldSurePassWord resignFirstResponder];
    [self.textFieldTelNumber resignFirstResponder];
    [self.textFieldVerificationCode resignFirstResponder];
}
- (void)pressButton: (UIButton *)button {
    
    [self.delegate returnButton:button];
}
- (void)seleMeth:(UIButton *)button {
    if (button.tag == 120) {
        button.tag = 121;
        [button setImage:[UIImage imageNamed:@"xuan-1.png"] forState:UIControlStateNormal];
    } else {
        button.tag = 120;
        [button setImage:[UIImage imageNamed:@"weixuan.png"] forState:UIControlStateNormal];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
