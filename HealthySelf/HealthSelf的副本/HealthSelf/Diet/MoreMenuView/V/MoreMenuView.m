//
//  MoreMenuView.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/13.
//

#import "MoreMenuView.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface MoreMenuView()<UITextFieldDelegate>
@end

@implementation MoreMenuView
- (void)viewInit {
    self.backgroundColor = [UIColor whiteColor];
#pragma mark SearchFoodText
    //查询框
    UIColor *newGray = [UIColor colorWithRed:240 / 255.0f green:240 / 255.0f blue:242 / 255.0f alpha:1.0];
    self.searchMenuTextField = [[UITextField alloc] init];
    self.searchMenuTextField.placeholder = @"搜索食谱关键字";
    self.searchMenuTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.searchMenuTextField.keyboardType = UIKeyboardTypeURL;
    self.searchMenuTextField.layer.masksToBounds = YES;
    self.searchMenuTextField.layer.cornerRadius = 16.0;
    self.searchImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sousuo-2.png"]];
    self.searchMenuTextField.leftViewMode = UITextFieldViewModeAlways;
    self.searchMenuTextField.leftView = self.searchImageView;
    // textField协议
    self.searchMenuTextField.delegate = self;
    self.searchMenuTextField.backgroundColor = newGray;
    
    [self addSubview: self.searchMenuTextField];
    [self addSubview: self.searchImageView];
    [self.searchMenuTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@25);
        make.height.equalTo(@35);
        make.width.equalTo(@(ScreenWidth - 90));
        make.top.equalTo(@100);
    }];
    [self.searchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@21);
        make.width.equalTo(@21);
    }];
    
    UIColor *buttonColor = [UIColor colorWithRed:105 / 255.0f green:183 / 255.0f blue:135 / 255.0f alpha:1.0];
    self.searchMenuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.searchMenuButton.tag = 1;
    self.searchMenuButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    self.searchMenuButton.tintColor = buttonColor;
    [self.searchMenuButton setTitle:@"搜索" forState:UIControlStateNormal];
    [self.searchMenuButton addTarget:self action:@selector(pressExit:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.searchMenuButton];
    [self.searchMenuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo([self.searchMenuTextField mas_right]).offset(1);
        make.top.equalTo(@88);
        make.width.equalTo(@70);
        make.height.equalTo(@50);
    }];
    
  
    self.usersLabel= [[UILabel alloc] init];
    self.usersLabel.text = @"大家都在搜";
    self.usersLabel.textColor = [UIColor blackColor];
    self.usersLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:19];
    [self addSubview:self.usersLabel];
    [self.usersLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.searchMenuTextField mas_bottom]).offset(30);
        make.left.equalTo([self.searchMenuTextField mas_left]).offset(-1);
        make.width.equalTo(@120);
        make.height.equalTo(@40);
    }];
    self.majoritySearchFoodArray = @[@"减脂", @"减肥", @"月子", @"蛋白", @"鱼", @"健身", @"粥"];
    for (int i = 0; i < 7; i++) {
        self.majorySearchFoodButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.majorySearchFoodButton.layer.masksToBounds = YES;
        self.majorySearchFoodButton.layer.cornerRadius = 15.0;
        self.majorySearchFoodButton.backgroundColor = newGray;
        self.majorySearchFoodButton.tintColor = [UIColor blackColor];
        [self.majorySearchFoodButton setTitle:self.majoritySearchFoodArray[i] forState:UIControlStateNormal];
        [self.majorySearchFoodButton addTarget:self action:@selector(pressExit:) forControlEvents:UIControlEventTouchUpInside];
        self.majorySearchFoodButton.tag = 100 + i;
        [self addSubview:self.majorySearchFoodButton];
        if (self.majorySearchFoodButton.tag < 104) {
            [self.majorySearchFoodButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([self.usersLabel mas_bottom]).offset(20);
                make.left.equalTo([self.usersLabel mas_left]).offset(2 + i * 80);
                make.width.equalTo(@60);
                make.height.equalTo(@30);
            }];
        } else {
            [self.majorySearchFoodButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([self.usersLabel mas_bottom]).offset(70);
                make.left.equalTo([self.usersLabel mas_left]).offset(2 + (i - 4) * 80);
                make.width.equalTo(@60);
                make.height.equalTo(@30);
            }];
        }
    }
}
- (void)pressExit:(UIButton *)button {
    if (button.tag == 1) {
        NSString *menuName = self.searchMenuTextField.text;
        if (menuName == nil || menuName.length == 0) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"searchError" object:nil userInfo:nil];
        } else {
            NSDictionary *keyNameDictionary = @{@"menuName":menuName};
            [[NSNotificationCenter defaultCenter] postNotificationName:@"keyMenuName" object:nil userInfo:keyNameDictionary];
        }
    } else {
        [self.MenuButtonDelegate returnButton:button];
    }
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //回收键盘对象
    //隐藏TableView
    [self.searchMenuTextField resignFirstResponder];;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
