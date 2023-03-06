//
//  VIewDiet.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import "DietView.h"
#import <Masonry.h>
#import <SDWebImage/SDWebImage.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface DietView()
@property (nonatomic, strong)UIImageView *menuImageView1;
@property (nonatomic, strong)UILabel *menuCategory1;
@property (nonatomic, strong)UILabel *menuNameLabel1;
@property (nonatomic, strong)UILabel *peopleNumaLabel1;
@property (nonatomic, strong)UILabel *cookingtimeLabel1;

@property (nonatomic, strong)UIImageView *menuImageView2;
@property (nonatomic, strong)UILabel *menuCategory2;
@property (nonatomic, strong)UILabel *menuNameLabel2;
@property (nonatomic, strong)UILabel *peopleNumaLabel2;
@property (nonatomic, strong)UILabel *cookingtimeLabel2;
@end
@implementation DietView
- (void)viewInit {
    self.backgroundColor = [UIColor whiteColor];
    [self newBackSet];
#pragma mark Label
    UIColor *labelGreen = [UIColor colorWithRed:124 / 255.0f green:193 / 255.0f blue:156 / 255.0f alpha:1.0];
    UIColor *labelGreen2 = [UIColor colorWithRed:235 / 255.0f green:255 / 255.0f blue:240 / 255.0f alpha:1.0];
    self.backView = [[UIView alloc] init];
    self.backView.backgroundColor = labelGreen2;
    self.backView.layer.masksToBounds = YES;
    self.backView.layer.cornerRadius = 20.0;
    [self addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(ScreenWidth / 2 - 20));
        make.height.equalTo(@43);
        make.left.equalTo(@105);
        make.top.equalTo(@70);
    }];
    
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
#pragma mark -MoreButton
    NSArray *moreLabelArray = @[@"查水果", @"查饮品", @"拍照查", @"查食谱"];
    NSArray *coinsArray = @[@"shuiguo.png", @"naicha.jpeg", @"xiangji.png", @"yiliaoshipu.png"];
    for (int i = 0; i < 4; i++) {
        self.moreLabel = [[UILabel alloc] init];
        [self addSubview:self.moreLabel];
        self.moreLabel.text = moreLabelArray[i];
        self.moreLabel.font = [UIFont systemFontOfSize:13];
        self.moreLabel.textColor = [UIColor blackColor];
        self.moreLabel.frame = CGRectMake(35 + i * ScreenWidth / 4, 270, 150, 50);
        
        self.moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.moreButton setImage:[UIImage imageNamed:coinsArray[i]] forState:UIControlStateNormal];
        [self addSubview:self.moreButton];
        self.moreButton.tag = 200 + i;
        [self.moreButton addTarget:self action:@selector(pressMoreButton:) forControlEvents:UIControlEventTouchUpInside];
        self.moreButton.frame = CGRectMake(27 + i * ScreenWidth / 4, 215, 55, 55);
    }
    [self creatMenu];
    
}
- (void)creatMenu {
#pragma mark CreatMenu
    UIColor *newGreen = [UIColor colorWithRed:30 / 255.0f green:183 / 255.0f blue:131 / 255.0f alpha:1.0];
    UIColor *menuLineViewColor = [UIColor colorWithRed: 248 / 255.0f green:248 / 255.0f blue:248 / 255.0f alpha:1.0];
    self.menuLabel = [[UILabel alloc] init];
    self.menuLabel.layer.masksToBounds = YES;
    self.menuLabel.layer.cornerRadius = 12.0;
    self.menuLabel.text = @"营养菜谱";
    self.menuLabel.textColor = [UIColor whiteColor];
    self.menuLabel.font = [UIFont fontWithName:@"TimesNewRomanPs-BoldItalicMT" size:13];
    self.menuLabel.textAlignment = NSTextAlignmentCenter;
    self.menuLabel.backgroundColor = newGreen;
    
    self.menuLineView = [[UIView alloc] init];
    self.menuLineView.backgroundColor = menuLineViewColor;
    
    self.menuLineView2 = [[UIView alloc] init];
    self.menuLineView2.backgroundColor = menuLineViewColor;
    
    self.menuBackView = [[UIView alloc] init];
    self.menuBackView.backgroundColor = [UIColor whiteColor];
    self.menuBackView.layer.borderWidth = 0.2;
    self.menuBackView.layer.borderColor = [UIColor grayColor].CGColor;
    self.menuBackView.layer.masksToBounds = YES;
    self.menuBackView.layer.cornerRadius = 20.0;
    
    self.menuBackView2 = [[UIView alloc] init];
    self.menuBackView2.backgroundColor = [UIColor whiteColor];
    self.menuBackView2.layer.borderWidth = 0.2;
    self.menuBackView2.layer.borderColor = [UIColor grayColor].CGColor;
    self.menuBackView2.layer.masksToBounds = YES;
    self.menuBackView2.layer.cornerRadius = 20.0;
    
   
    self.moreMenuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.moreMenuButton setTitle:@"获取更多菜谱" forState:UIControlStateNormal];
    self.moreMenuButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.moreMenuButton.layer.masksToBounds = YES;
    self.moreMenuButton.layer.cornerRadius = 14;
    self.moreMenuButton.layer.borderWidth = 0.5;
    self.moreMenuButton.tintColor = [UIColor whiteColor];
    self.moreMenuButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.moreMenuButton.backgroundColor = newGreen;
    self.moreMenuButton.tag = 668;
    [self.moreMenuButton addTarget:self action:@selector(pressMenuButton:) forControlEvents:UIControlEventTouchUpInside];
  
    self.weatherLabel = [[UILabel alloc] init];
    self.weatherLabel.layer.masksToBounds = YES;
    self.weatherLabel.layer.cornerRadius = 12.0;
    self.weatherLabel.text = @"每日鸡汤";
    self.weatherLabel.textColor = [UIColor whiteColor];
    self.weatherLabel.font = [UIFont fontWithName:@"TimesNewRomanPs-BoldItalicMT" size:13];
    self.weatherLabel.textAlignment = NSTextAlignmentCenter;
    self.weatherLabel.backgroundColor = newGreen;
    
    
    [self addSubview:self.menuLabel];
    [self addSubview:self.menuLineView];
    [self addSubview:self.menuBackView];
    [self addSubview:self.menuBackView2];
    [self addSubview:self.moreMenuButton];
    [self addSubview:self.menuLineView2];
    [self addSubview:self.weatherLabel];
    [self.menuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.labelHealth mas_bottom]).offset(ScreenHeight / 4);
        make.left.equalTo(@15);
        make.height.equalTo(@25);
        make.width.equalTo(@(ScreenWidth / 5 - 5));
     }];
    [self.menuLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo([self.menuLabel mas_bottom]).offset(-40);
        make.height.equalTo(@2.5);
        make.left.equalTo(@0);
        make.width.equalTo(@(ScreenWidth));
    }];
    [self.menuBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@160);
        make.height.equalTo(@238);
        make.left.equalTo([self.menuLabel mas_left]).offset(10);
        make.top.equalTo([self.menuLabel mas_bottom]).offset(10);
    }];
    [self.menuBackView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@160);
        make.height.equalTo(@238);
        make.left.equalTo([self.menuBackView mas_right]).offset(20);
        make.top.equalTo([self.menuLabel mas_bottom]).offset(10);
    }];
    [self.moreMenuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.menuBackView mas_bottom]).offset(20);
        make.left.equalTo(@(ScreenWidth / 4 + 30));
        make.width.equalTo(@120);
        make.height.equalTo(@30);
    }];
    [self.menuLineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo([self.moreMenuButton mas_bottom]).offset(15);
        make.height.equalTo(@2.5);
        make.left.equalTo(@0);
        make.width.equalTo(@(ScreenWidth));
    }];
    [self.weatherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.menuLineView2 mas_bottom]).offset(5);
        make.left.equalTo(@15);
        make.height.equalTo(@25);
        make.width.equalTo(@(ScreenWidth / 5 - 5));
     }];
}
- (void)creatMenuDetails {
    self.menuImageView1 = [[UIImageView alloc] init];
    self.menuImageView1.layer.masksToBounds = YES;
    self.menuImageView1.layer.cornerRadius = 16.0;
    NSString* imageName = [NSString stringWithFormat:@"%@", self.menuDicit1[@"result"][@"result"][@"list"][0][@"pic"]];
    NSURL* urlImage = [NSURL URLWithString:imageName];
    [self.menuImageView1 sd_setImageWithURL:urlImage];
    
    self.menuNameLabel1 = [[UILabel alloc] init];
    self.menuNameLabel1.font = [UIFont fontWithName:@"TimesNewRomanPs-BoldItalicMT" size:15];
    self.menuNameLabel1.text = self.menuDicit1[@"result"][@"result"][@"list"][0][@"name"];
    
    self.menuCategory1 = [[UILabel alloc] init];
    self.menuCategory1.font = [UIFont systemFontOfSize:12];
    self.menuCategory1.textColor = [UIColor grayColor];
    self.menuCategory1.text = @"减脂小餐";
   
    self.peopleNumaLabel1 = [[UILabel alloc] init];
    self.peopleNumaLabel1.font = [UIFont systemFontOfSize:12];
    self.peopleNumaLabel1.textColor = [UIColor redColor];
    self.peopleNumaLabel1.text = self.menuDicit1[@"result"][@"result"][@"list"][0][@"peoplenum"];
    
    self.cookingtimeLabel1 = [[UILabel alloc] init];
    self.cookingtimeLabel1.font = [UIFont systemFontOfSize:12];
    self.cookingtimeLabel1.textColor = [UIColor grayColor];
    self.cookingtimeLabel1.text = self.menuDicit1[@"result"][@"result"][@"list"][0][@"cookingtime"];
    
    self.menuButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.menuButton1 addTarget:self action:@selector(pressMenuButton:) forControlEvents:UIControlEventTouchUpInside];
    self.menuButton1.tag = 667;
    
    [self.menuBackView addSubview:self.menuImageView1];
    [self.menuBackView addSubview:self.menuNameLabel1];
    [self.menuBackView addSubview:self.menuCategory1];
    [self.menuBackView addSubview:self.peopleNumaLabel1];
    [self.menuBackView addSubview:self.cookingtimeLabel1];
    [self.menuBackView addSubview:self.menuButton1];
    
    [self.menuImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@00);
        make.width.equalTo(@158);
        make.height.equalTo(@158);
    }];
    [self.menuNameLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.menuImageView1 mas_bottom]).offset(10);
        make.left.equalTo(@10);
    }];
    [self.menuCategory1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.menuNameLabel1 mas_bottom]).offset(10);
        make.left.equalTo(@10);
    }];
    [self.peopleNumaLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.menuCategory1 mas_bottom]).offset(10);
        make.left.equalTo(@10);
    }];
    [self.cookingtimeLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.menuCategory1 mas_bottom]).offset(10);
        make.left.equalTo([self.peopleNumaLabel1 mas_right]).offset(5);
    }];
    [self.menuButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@160);
        make.height.equalTo(@238);
        make.left.equalTo(@0);
        make.top.equalTo(@0);
    }];
    
    
    self.menuImageView2 = [[UIImageView alloc] init];
    self.menuImageView2.layer.masksToBounds = YES;
    self.menuImageView2.layer.cornerRadius = 16.0;
    NSString* imageName2 = [NSString stringWithFormat:@"%@", self.menuDicit2[@"result"][@"result"][@"list"][0][@"pic"]];
    NSURL* urlImage2 = [NSURL URLWithString:imageName2];
    [self.menuImageView2 sd_setImageWithURL:urlImage2];
    
    self.menuNameLabel2 = [[UILabel alloc] init];
    self.menuNameLabel2.font = [UIFont fontWithName:@"TimesNewRomanPs-BoldItalicMT" size:15];
    self.menuNameLabel2.text = self.menuDicit2[@"result"][@"result"][@"list"][0][@"name"];
    
    self.menuCategory2 = [[UILabel alloc] init];
    self.menuCategory2.font = [UIFont systemFontOfSize:12];
    self.menuCategory2.textColor = [UIColor grayColor];
    self.menuCategory2.text = @"营养搭配";
   
    self.peopleNumaLabel2 = [[UILabel alloc] init];
    self.peopleNumaLabel2.font = [UIFont systemFontOfSize:12];
    self.peopleNumaLabel2.textColor = [UIColor redColor];
    self.peopleNumaLabel2.text = self.menuDicit2[@"result"][@"result"][@"list"][0][@"peoplenum"];
    
    self.cookingtimeLabel2 = [[UILabel alloc] init];
    self.cookingtimeLabel2.font = [UIFont systemFontOfSize:12];
    self.cookingtimeLabel2.textColor = [UIColor grayColor];
    self.cookingtimeLabel2.text = self.menuDicit2[@"result"][@"result"][@"list"][0][@"cookingtime"];
    
    self.menuButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.menuButton2.tag = 666;
    [self.menuButton2 addTarget:self action:@selector(pressMenuButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.menuBackView2 addSubview:self.menuImageView2];
    [self.menuBackView2 addSubview:self.menuNameLabel2];
    [self.menuBackView2 addSubview:self.menuCategory2];
    [self.menuBackView2 addSubview:self.peopleNumaLabel2];
    [self.menuBackView2 addSubview:self.cookingtimeLabel2];
    [self.menuBackView2 addSubview:self.menuButton2];
    
    [self.menuImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.width.equalTo(@155);
        make.height.equalTo(@155);
    }];
    [self.menuNameLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.menuImageView2 mas_bottom]).offset(10);
        make.left.equalTo(@10);
    }];
    [self.menuCategory2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.menuNameLabel2 mas_bottom]).offset(10);
        make.left.equalTo(@10);
    }];
    [self.peopleNumaLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.menuCategory2 mas_bottom]).offset(10);
        make.left.equalTo(@10);
    }];
    [self.cookingtimeLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.menuCategory2 mas_bottom]).offset(10);
        make.left.equalTo([self.peopleNumaLabel2 mas_right]).offset(5);
    }];
    [self.menuButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@160);
        make.height.equalTo(@238);
        make.left.equalTo(@0);
        make.top.equalTo(@0);
    }];
    [self creatEveLabelView];
}
#pragma mark EveLabel
- (void)creatEveLabelView {
    UIColor *eveDLabelBackViewColor = [UIColor colorWithRed:219 / 255.0f green:233 / 255.0f blue:254 / 255.0f alpha:1.0];
    self.eveBackView = [[UIView alloc] init];
    self.eveBackView.backgroundColor = eveDLabelBackViewColor;
    self.eveBackView.layer.masksToBounds = YES;
    self.eveBackView.layer.cornerRadius = 20.0;
    
    self.eveContLabel = [[UILabel alloc] init];
    self.eveContLabel.text = self.eveDDic[@"data"][0][@"content"];
    self.eveContLabel.font = [UIFont fontWithName:@"TimesNewRomanPs-BoldItalicMT" size:13];
    self.eveContLabel.numberOfLines = 0;
    
    [self addSubview:self.eveBackView];
    [self.eveBackView addSubview:self.eveContLabel];
    
    [self.eveBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(ScreenWidth - 30));
        make.height.equalTo(@58);
        make.left.equalTo(@15);
        make.top.equalTo([self.weatherLabel mas_bottom]).offset(5);
    }];
    [self.eveContLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(ScreenWidth - 50));
        make.left.equalTo(@10);
        make.top.equalTo(@7);
    }];
    
    
}
#pragma mark SearchFood

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    /*注册通知并发送*/
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ToSearchFoodView" object:nil userInfo:nil];
}
- (void)pressMoreButton:(UIButton *)button {
    [self.moreButtonDelegate returnMoreButtonTag:button];
}
- (void)pressMenuButton:(UIButton *)menuButton {
    [self.menuButtonDelegate returnMenuButtonTag:menuButton];
}
- (void)newBackSet {
    UIColor *labelGreen2 = [UIColor colorWithRed:190 / 255.0f green:225 / 255.0f blue:180 / 255.0f alpha:1.0];
//        UIColor *labelGreen2 = [UIColor colorWithRed:125 / 255.0f green:210 / 255.0f blue:154 / 255.0f alpha:1.0];
    //通过CAGradientLayer 设置渐变的背景。
   CAGradientLayer *layer = [CAGradientLayer new];
   //colors存放渐变的颜色的数组
   layer.colors=@[(__bridge id)labelGreen2.CGColor,(__bridge id)[UIColor whiteColor].CGColor];
   /**
    * 起点和终点表示的坐标系位置，(0,0)表示左上角，(1,1)表示右下角
    */
   layer.startPoint = CGPointMake(0.5, 0);
   layer.endPoint = CGPointMake(0.5, 1);
   layer.frame = self.bounds;
   [self.layer addSublayer:layer];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
