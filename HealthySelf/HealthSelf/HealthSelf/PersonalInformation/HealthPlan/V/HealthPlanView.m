//
//  HealthPlanView.m
//  HealthSelf
//
//  Created by 张佳慧 on 2023/2/3.
//

#import "HealthPlanView.h"
#import "Masonry.h"
@implementation HealthPlanView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    
    UIView* headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 100)];
    headView.backgroundColor = [UIColor whiteColor];
    [self addSubview:headView];
    
    UILabel* titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"体重管理方案";
    titleLabel.font = [UIFont systemFontOfSize:19];
    [headView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bounds.size.width/2-57);
        make.top.mas_equalTo(50);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    [headView addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(50);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    UILabel* basicLabel = [[UILabel alloc] init];
    basicLabel.font = [UIFont boldSystemFontOfSize:18];
    basicLabel.text = @"基本信息";
    [self addSubview:basicLabel];
    [basicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(110);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    UIView* bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 170, self.bounds.size.width, 300)];
    bottomView.layer.cornerRadius = 35;
    bottomView.layer.masksToBounds = YES;
    bottomView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bottomView];
    
//粉色底
    UIView* firstView = [[UIView alloc] init];
    firstView.backgroundColor = [UIColor colorWithRed:0.9 green:0.4 blue:0.5 alpha:0.15];
    firstView.layer.masksToBounds = YES;
    firstView.layer.cornerRadius = 20;
    [bottomView addSubview:firstView];
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottomView).offset(15);
        make.top.equalTo(bottomView).offset(20);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    
    UIView* secondView = [[UIView alloc] init];
    secondView.backgroundColor = [UIColor colorWithRed:0.9 green:0.4 blue:0.5 alpha:0.15];
    secondView.layer.masksToBounds = YES;
    secondView.layer.cornerRadius = 20;
    [bottomView addSubview:secondView];
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottomView).offset(147);
        make.top.equalTo(bottomView).offset(20);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    
    UIView* thirdView = [[UIView alloc] init];
    thirdView.backgroundColor = [UIColor colorWithRed:0.9 green:0.4 blue:0.5 alpha:0.15];
    thirdView.layer.masksToBounds = YES;
    thirdView.layer.cornerRadius = 20;
    [bottomView addSubview:thirdView];
    [thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottomView).offset(280);
        make.top.equalTo(bottomView).offset(20);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    
    
//身高体重年龄
    UILabel* heightLabel = [[UILabel alloc] init];
    heightLabel.text = @"164cm";
    heightLabel.font = [UIFont boldSystemFontOfSize:18];
    [firstView addSubview:heightLabel];
    [heightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(firstView).offset(20);
        make.top.mas_equalTo(40);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(50);
    }];


    UILabel* weightLabel = [[UILabel alloc] init];
    weightLabel.text = @"45kg";
    weightLabel.font = [UIFont boldSystemFontOfSize:18];
    [secondView addSubview:weightLabel];
    [weightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(secondView).offset(28);
        make.top.mas_equalTo(40);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(50);
    }];
    
    UILabel* ageLabel = [[UILabel alloc] init];
    ageLabel.text = @"19岁";
    ageLabel.font = [UIFont boldSystemFontOfSize:18];
    [thirdView addSubview:ageLabel];
    [ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(thirdView).offset(30);
        make.top.mas_equalTo(40);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(50);
    }];
    
    UILabel* firstLabel = [[UILabel alloc] init];
    firstLabel.font = [UIFont systemFontOfSize:16];
    firstLabel.text = @"身高";
    [firstView addSubview:firstLabel];
    [firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(firstView).offset(33);
        make.top.mas_equalTo(7);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(50);
    }];
    
    UILabel* secondLabel = [[UILabel alloc] init];
    secondLabel.font = [UIFont systemFontOfSize:16];
    secondLabel.text = @"体重";
    [secondView addSubview:secondLabel];
    [secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(secondView).offset(33);
        make.top.mas_equalTo(7);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(50);
    }];
    
    UILabel* thirdLabel = [[UILabel alloc] init];
    thirdLabel.font = [UIFont systemFontOfSize:16];
    thirdLabel.text = @"年龄";
    [thirdView addSubview:thirdLabel];
    [thirdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(thirdView).offset(33);
        make.top.mas_equalTo(7);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(50);
    }];
    
//*****
    UILabel* bmiLabel = [[UILabel alloc] init];
    bmiLabel.text = @"最新BMI";
    bmiLabel.font = [UIFont systemFontOfSize:17];
    [bottomView addSubview:bmiLabel];
    [bmiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.equalTo(firstView).offset(110);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    UIView* oneView = [[UIView alloc] init];
    oneView.backgroundColor = [UIColor colorWithRed:0.9 green:0.4 blue:0.5 alpha:0.1];
    oneView.layer.masksToBounds = YES;
    oneView.layer.cornerRadius = 7;
    [bottomView addSubview:oneView];
    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.equalTo(firstView).offset(170);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(15);
    }];
    UIView* twoView = [[UIView alloc] init];
    twoView.backgroundColor = [UIColor colorWithRed:0.4 green:0.9 blue:0.5 alpha:0.5];
    twoView.layer.masksToBounds = YES;
    twoView.layer.cornerRadius = 7;
    [bottomView addSubview:twoView];
    [twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(105);
        make.top.equalTo(firstView).offset(170);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(15);
    }];
    
    UIView* threeView = [[UIView alloc] init];
    threeView.backgroundColor = [UIColor colorWithRed:0.9 green:0.8 blue:0.2 alpha:0.6];
    threeView.layer.masksToBounds = YES;
    threeView.layer.cornerRadius = 7;
    [bottomView addSubview:threeView];
    [threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(195);
        make.top.equalTo(firstView).offset(170);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(15);
    }];
    
    UIView* fourthView = [[UIView alloc] init];
    fourthView.backgroundColor = [UIColor colorWithRed:0.9 green:0.6 blue:0.2 alpha:0.5];
    fourthView.layer.masksToBounds = YES;
    fourthView.layer.cornerRadius = 7;
    [bottomView addSubview:fourthView];
    [fourthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(285);
        make.top.equalTo(firstView).offset(170);
        make.width.mas_equalTo(85);
        make.height.mas_equalTo(15);
    }];
    

    NSArray* array = @[@"偏瘦",@"理想",@"偏胖",@"微胖"];
    for (int i = 0; i < 4; i++ ) {
        UILabel* label = [[UILabel alloc] init];
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:15];
        label.text = array[i];
        [bottomView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(60+i*80);
            make.top.equalTo(firstView).offset(180);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(50);
        }];
    }
    
    _bmlDataLabel = [[UILabel alloc] init];
    _bmlDataLabel.text = @"16.7";
    _bmlDataLabel.font = [UIFont boldSystemFontOfSize:19];
    [bottomView addSubview:_bmlDataLabel];
    [_bmlDataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(290);
        make.top.equalTo(firstView).offset(110);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    

    
    //基础代谢
    UILabel* smallLabel = [[UILabel alloc] init];
    smallLabel.text = @"基础代谢";
    smallLabel.font = [UIFont systemFontOfSize:17];
    [bottomView addSubview:smallLabel];
    [smallLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.equalTo(firstView).offset(220);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    _basicDataLabel = [[UILabel alloc] init];
    _basicDataLabel.text = @"1136";
    _basicDataLabel.font = [UIFont boldSystemFontOfSize:19];
    [bottomView addSubview:_basicDataLabel];
    [_basicDataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(290);
        make.top.equalTo(firstView).offset(220);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    //单位
    UILabel* easyLabel = [[UILabel alloc] init];
    easyLabel.text = @"千卡";
    easyLabel.font = [UIFont systemFontOfSize:15];
    [bottomView addSubview:easyLabel];
    [easyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(340);
        make.top.equalTo(firstView).offset(220);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    UIView* otherBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 530, self.bounds.size.width, 200)];
    otherBottomView.layer.cornerRadius = 35;
    otherBottomView.layer.masksToBounds = YES;
    otherBottomView.backgroundColor = [UIColor whiteColor];
    [self addSubview:otherBottomView];

    UILabel* aimLabel = [[UILabel alloc] init];
    aimLabel.text = @"体重目标";
    aimLabel.font = [UIFont boldSystemFontOfSize:18];
    [self addSubview:aimLabel];
    [aimLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.equalTo(bottomView).offset(57);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    UIView* lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor colorWithRed:0.5 green:0.4 blue:0.9 alpha:0.1];
    lineView.layer.masksToBounds = YES;
    lineView.layer.cornerRadius = 7;
    [otherBottomView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(17);
        make.top.equalTo(otherBottomView).offset(30);
        make.width.mas_equalTo(360);
        make.height.mas_equalTo(15);
    }];
    
    UILabel* keepLabel = [[UILabel alloc] init];
    keepLabel.text = @"保持中";
    keepLabel.textColor = [UIColor whiteColor];
    keepLabel.textAlignment = NSTextAlignmentCenter;
    keepLabel.font = [UIFont systemFontOfSize:15];
    keepLabel.layer.cornerRadius = 10;
    keepLabel.layer.masksToBounds = YES;
    keepLabel.backgroundColor = [UIColor colorWithRed:0.5 green:0.4 blue:0.9 alpha:0.5];
    [otherBottomView addSubview:keepLabel];
    [keepLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(175);
        make.top.equalTo(otherBottomView).offset(25);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(25);
    }];
    
    
    UIView* lowBottomView = [[UIView alloc] init];
    lowBottomView.backgroundColor = [UIColor colorWithRed:0.1 green:0.6 blue:0.9 alpha:0.2];
    lowBottomView.layer.masksToBounds = YES;
    lowBottomView.layer.cornerRadius = 18;
    [otherBottomView addSubview:lowBottomView];
    [lowBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(otherBottomView).offset(25);
        make.top.equalTo(otherBottomView).offset(80);
        make.width.mas_equalTo(160);
        make.height.mas_equalTo(80);
    }];
    UIView* topBottomView = [[UIView alloc] init];
    topBottomView.backgroundColor = [UIColor colorWithRed:0.1 green:0.9 blue:0.4 alpha:0.2];
    topBottomView.layer.masksToBounds = YES;
    topBottomView.layer.cornerRadius = 18;
    [otherBottomView addSubview:topBottomView];
    [topBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(otherBottomView).offset(210);
        make.top.equalTo(otherBottomView).offset(80);
        make.width.mas_equalTo(160);
        make.height.mas_equalTo(80);
    }];
    
    
    UILabel* lowLabel = [[UILabel alloc] init];
    lowLabel.text = @"保持下限";
    lowLabel.textColor = [UIColor darkGrayColor];
    lowLabel.font = [UIFont systemFontOfSize:17];
    [lowBottomView addSubview:lowLabel];
    [lowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lowBottomView).offset(45);
        make.top.equalTo(lowBottomView).offset(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    UILabel* topLabel = [[UILabel alloc] init];
    topLabel.text = @"保持上限";
    topLabel.textColor = [UIColor darkGrayColor];
    topLabel.font = [UIFont systemFontOfSize:17];
    [topBottomView addSubview:topLabel];
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topBottomView).offset(45);
        make.top.equalTo(topBottomView).offset(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    _lowDataLabel = [[UILabel alloc] init];
    _lowDataLabel.text = @"42.8kg";
    _lowDataLabel.font = [UIFont boldSystemFontOfSize:21];
    _lowDataLabel.textColor = [UIColor colorWithRed:0.1 green:0.6 blue:0.9 alpha:1];
    [lowBottomView addSubview:_lowDataLabel];
    [_lowDataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lowBottomView).offset(45);
        make.top.equalTo(lowBottomView).offset(30);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    _topDataLabel = [[UILabel alloc] init];
    _topDataLabel.text = @"47.3kg";
    _topDataLabel.font = [UIFont boldSystemFontOfSize:21];
    _topDataLabel.textColor = [UIColor colorWithRed:0.4 green:0.9 blue:0.3 alpha:1];
    [topBottomView addSubview:_topDataLabel];
    [_topDataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topBottomView).offset(45);
        make.top.equalTo(topBottomView).offset(30);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    return self;
}

@end
