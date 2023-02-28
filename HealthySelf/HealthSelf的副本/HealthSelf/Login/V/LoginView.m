//
//  ViewLogin.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/5.
//

#import "LoginView.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@implementation LoginView
- (void)viewInit {
    UIColor *newGreen = [UIColor colorWithRed:30 / 255.0f green:183 / 255.0f blue:131 / 255.0f alpha:1.0];
    UIColor *newGreen2 = [UIColor colorWithRed:69 / 255.0f green:113 / 255.0f blue:81 / 255.0f alpha:1.0];
    UIColor *backGreen = [UIColor colorWithRed:20 / 255.0f green:220 / 255.0f blue:150 / 255.0f alpha:1.0];
    self.backgroundColor = backGreen;
#pragma mark UserName
    //用户名输入框
    self.textFieldUserName = [[UITextField alloc] init];
    self.textFieldUserName.placeholder = @"请输入用户名";
    self.textFieldUserName.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldUserName.keyboardType = UIKeyboardTypeURL;
    self.textFieldUserName.layer.masksToBounds = YES;
    self.textFieldUserName.layer.cornerRadius = 18.0;
    self.textFieldUserName.layer.borderWidth = 0.5;
    self.textFieldUserName.layer.borderColor = newGreen2.CGColor;
    // 输入框的图片
    self.imageViewUserName = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jiankang.png"]];
    self.textFieldUserName.leftViewMode = UITextFieldViewModeAlways;
    self.textFieldUserName.leftView = self.imageViewUserName;
    // textField协议
    self.textFieldUserName.delegate = self;
    
    [self addSubview:self.textFieldUserName];
    [self addSubview:self.imageViewUserName];
    [self.imageViewUserName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@30);
        make.width.equalTo(@30);
    }];
    [self.textFieldUserName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(ScreenWidth / 6));
        make.height.equalTo(@40);
        make.width.equalTo(@(ScreenWidth / 3 * 2));
        make.top.equalTo(@(ScreenHeight / 2 - 100));
    }];
    
#pragma mark PassWord
    //密码
    self.textFieldPassWord = [[UITextField alloc] init];
    self.textFieldPassWord.placeholder = @" 请输入密码";
    self.textFieldPassWord.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldPassWord.keyboardType = UIKeyboardTypeURL;
    self.textFieldPassWord.layer.masksToBounds = YES;
    self.textFieldPassWord.layer.cornerRadius = 18.0;
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
        make.left.equalTo(@(ScreenWidth / 6));
        make.height.equalTo(@40);
        make.width.equalTo(@(ScreenWidth / 3 * 2));
        make.top.equalTo(self.textFieldUserName).offset(70);
    }];
#pragma mark Login
    self.buttontLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.buttontLogin setTitle:@"登录" forState:UIControlStateNormal];
    self.buttontLogin.titleLabel.font = [UIFont systemFontOfSize:18];
    self.buttontLogin.layer.masksToBounds = YES;
    self.buttontLogin.layer.cornerRadius = 14;
    self.buttontLogin.layer.borderWidth = 0.5;
    self.buttontLogin.tintColor = [UIColor whiteColor];
    self.buttontLogin.layer.borderColor = [UIColor grayColor].CGColor;
    self.buttontLogin.backgroundColor = newGreen;
    self.buttontLogin.tag = 0;
    [self.buttontLogin addTarget:self action:@selector(pressLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.buttontLogin];
    [self.buttontLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textFieldPassWord).offset(70);
        make.left.equalTo(@(ScreenWidth / 4 + 14));
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    
#pragma mark Register
    self.buttontRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.buttontRegister setTitle:@"注册" forState:UIControlStateNormal];
    self.buttontRegister.titleLabel.font = [UIFont systemFontOfSize:18];
    self.buttontRegister.tintColor = [UIColor whiteColor];
    self.buttontRegister.layer.borderColor = [UIColor grayColor].CGColor;
    self.buttontRegister.tag = 1;
    [self.buttontRegister addTarget:self action:@selector(pressLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.buttontRegister];
    [self.buttontRegister mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buttontLogin).offset(45);
        make.left.equalTo(@(ScreenWidth / 4 + 14));
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
#pragma mark Label
    self.labelHealth = [[UILabel alloc] init];
    self.labelHealth.text = @" Keep Healthy";
    self.labelHealth.textColor = [UIColor whiteColor];
    /**
     关于字体斜体的设置- 我测试了好半天才发现只有英语能设置斜体等字体- 坑啊 Helvetica-BoldOblique
     Zapfino 花体 Georgia-BoldItalic
     */
    self.labelHealth.font = [UIFont fontWithName:@"TimesNewRomanPs-BoldItalicMT" size:33];
    self.labelHealth.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.labelHealth];
    [self.labelHealth mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.textFieldUserName).offset(-125);
        make.left.equalTo(@-10);
        make.height.equalTo(@50);
        make.width.equalTo(@(ScreenWidth));
    }];
}
#pragma mark TextFieldDelegateMEthod
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //回收键盘对象
    [self.textFieldUserName resignFirstResponder];
    [self.textFieldPassWord resignFirstResponder];
}
#pragma mark ButtonTarget
- (void)pressLogin:(UIButton *)button {
    if (button.tag == 0) {
        NSString *userName = self.textFieldUserName.text;
        NSString *passWord = self.textFieldPassWord.text;
        self.dictionaryUser = @{@"username":userName, @"password":passWord};
        /*注册通知并发送*/
        [[NSNotificationCenter defaultCenter] postNotificationName:@"userMessage" object:nil userInfo:self.dictionaryUser];
        /*清空输入栏*/
        [self textToNil];
    }
    [self.delegateButton returnButton:button];
   
}
- (void)textToNil {
    self.textFieldUserName.text = nil;
    self.textFieldPassWord.text = nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
