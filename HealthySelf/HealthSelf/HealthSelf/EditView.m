//
//  EditView.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/2/4.
//

#import "EditView.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

@interface EditView()<UITextFieldDelegate>
@property (nonatomic, strong) UIButton *exitButton;

// 选取图片
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *bottomBackView;
@property (nonatomic, strong) UIButton *sendButton;
@property (nonatomic, strong) UILabel *shareLabel;
@end

@implementation EditView
- (void)viewInit {
    UIColor* newBlack = [UIColor colorWithRed:37.0f / 255.0f green: 38.0f / 255.0f blue: 41.0f/255.0f alpha:1.0f];
    UIColor* newBlkGray = [UIColor colorWithRed:60.0f / 255.0f green: 61.0f / 255.0f blue: 72.0f/255.0f alpha:1.0f];
    UIColor* buttonTitleColor = [UIColor colorWithRed:172.0f / 255.0f green: 174.0f / 255.0f blue: 182.0f/255.0f alpha:1.0f];
    self.backgroundColor = [UIColor whiteColor];
    self.exitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.exitButton setImage:[UIImage imageNamed:@"cha.png"] forState:UIControlStateNormal];
    [self.exitButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    self.exitButton.tag = 0;
    self.exitButton.tintColor = [UIColor blackColor];
    
    self.titleTextField = [[UITextField alloc] init];
    self.titleTextField.delegate = self;
    self.titleTextField.placeholder = @"  分享你的心情，观点和经历.....";
    self.titleTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.titleTextField.keyboardType = UIKeyboardTypeURL;
    self.titleTextField.layer.masksToBounds = YES;
    self.titleTextField.layer.borderColor = [UIColor clearColor].CGColor;
    
    self.imageViewAvatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"add.png"]];
    self.imageViewAvatar.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGester = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAvator)];
    [self.imageViewAvatar addGestureRecognizer:tapGester];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"分享你喜欢的食物，生活照片(选填)";
    self.titleLabel.textColor = [UIColor grayColor];
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    
    self.bottomBackView = [[UIView alloc] init];
    self.bottomBackView.backgroundColor = newBlack;
    
    self.shareLabel = [[UILabel alloc] init];
    self.shareLabel.text = @"分享是一种博爱的心境,学会分享,就学会了生活";
    self.shareLabel.textColor = buttonTitleColor;
    self.shareLabel.textAlignment = NSTextAlignmentCenter;
    self.shareLabel.font = [UIFont fontWithName:@"TimesNewRomanPs-BoldItalicMT" size:15];
    
    self.sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.sendButton.backgroundColor = newBlkGray;
    [self.sendButton setTitle:@"发布" forState:UIControlStateNormal];
    self.sendButton.layer.masksToBounds = YES;
    self.sendButton.layer.cornerRadius = 5.0;
    self.sendButton.tag = 1;
    self.sendButton.tintColor = buttonTitleColor;
    self.sendButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.sendButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.exitButton];
    [self addSubview:self.titleTextField];
    [self addSubview:self.titleLabel];
    [self addSubview:self.imageViewAvatar];
    [self addSubview:self.bottomBackView];
    [self.bottomBackView addSubview:self.shareLabel];
    [self.bottomBackView addSubview:self.sendButton];
    
    [self.exitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@10);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    [self.titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(ScreenWidth));
        make.height.equalTo(@(45));
        make.top.equalTo([self.exitButton mas_bottom]).offset(30);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.titleTextField mas_bottom]).offset(20);
        make.left.equalTo(@15);
    }];
    [self.imageViewAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.titleLabel mas_bottom]).offset(17);
        make.left.equalTo(@15);
        make.height.equalTo(@126);
        make.width.equalTo(@130);
    }];
    [self.bottomBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.width.equalTo(@(ScreenWidth));
        make.height.equalTo(@180);
    }];
    [self.shareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@35);
        make.top.equalTo(@20);
    }];
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.shareLabel mas_bottom]).offset(20);
        make.left.equalTo(@15);
        make.width.equalTo(@(ScreenWidth - 30));
        make.height.equalTo(@40);
    }];
}
- (void)pressButton:(UIButton *)button {
    [self.delegate returnButton:button];
}
- (void)tapAvator {
    /*注册通知并发送*/
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Camare" object:nil userInfo:nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
