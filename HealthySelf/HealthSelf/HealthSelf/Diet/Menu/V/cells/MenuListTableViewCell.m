//
//  MenuListTableViewCell.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/11.
//

#import "MenuListTableViewCell.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@implementation MenuListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    UIColor *menuLineViewColor = [UIColor colorWithRed: 248 / 255.0f green:248 / 255.0f blue:248 / 255.0f alpha:1.0];
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.foodNameLabel = [[UILabel alloc] init];
        self.foodNameLabel.font = [UIFont fontWithName:@"TimesNewRomanPs-BoldItalicMT" size:16];
        self.foodNameLabel.numberOfLines = 0;
        self.foodNameLabel.text = @"自制营养好喝的草莓大果粒酸奶";
        
        self.peopelNumLabel = [[UILabel alloc] init];
        self.peopelNumLabel.font = [UIFont systemFontOfSize:12];
        self.peopelNumLabel.text = @"1-2人";
        self.peopelNumLabel.numberOfLines = 0;
        self.peopelNumLabel.textColor = [UIColor redColor];
        
    
        self.foodImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_2400.JPG"]];
        self.foodImageView.layer.masksToBounds = YES;
        self.foodImageView.layer.cornerRadius = 10.0;
        
        self.lineView = [[UIView alloc] init];
        self.lineView.backgroundColor = menuLineViewColor;
        
        self.cookingtimeLabel = [[UILabel alloc] init];
        self.cookingtimeLabel.font = [UIFont systemFontOfSize:12];
        self.cookingtimeLabel.text = @"准备时间:10分钟";
        self.cookingtimeLabel.numberOfLines = 0;
        self.cookingtimeLabel.textColor = [UIColor grayColor];
        
        UIColor *labelGreen = [UIColor colorWithRed:124 / 255.0f green:193 / 255.0f blue:156 / 255.0f alpha:1.0];
        self.menuLabel = [[UILabel alloc] init];
        self.menuLabel.layer.masksToBounds = YES;
        self.menuLabel.layer.cornerRadius = 12.0;
        self.menuLabel.text = @"食物标签";
        self.menuLabel.textColor = [UIColor whiteColor];
        self.menuLabel.font = [UIFont systemFontOfSize:13];
        self.menuLabel.textAlignment = NSTextAlignmentCenter;
        self.menuLabel.backgroundColor = labelGreen;
        
        UIColor *newBackGroundGray = [UIColor colorWithRed:246 / 255.0f green: 247 / 255.0f blue: 250 / 255.0f alpha:1.0];
        self.tagLabel = [[UILabel alloc] init];
        self.tagLabel.font = [UIFont systemFontOfSize:13];
        self.tagLabel.text = @"美容,春季,草莓味,饮品,下午茶,减肥,瘦身,养胃,调理肠胃,促消化,胃炎,消化不良,乳腺增生,肥胖";
        self.tagLabel.numberOfLines = 0;
        self.tagLabel.textAlignment = NSTextAlignmentCenter;
        self.tagLabel.layer.masksToBounds = YES;
        self.tagLabel.layer.cornerRadius = 12.0;
        self.tagLabel.textColor = [UIColor grayColor];
        self.tagLabel.backgroundColor = newBackGroundGray;
        
        self.authorLabel = [[UILabel alloc] init];
        self.authorLabel.font = [UIFont systemFontOfSize:13];
        self.authorLabel.text = @"菜品简介";
        self.authorLabel.numberOfLines = 0;
        self.authorLabel.textAlignment = NSTextAlignmentCenter;
        self.authorLabel.layer.masksToBounds = YES;
        self.authorLabel.layer.cornerRadius = 12.0;
        self.authorLabel.textColor = [UIColor whiteColor];
        self.authorLabel.backgroundColor = labelGreen;
        
        self.contenLabel = [[UILabel alloc] init];
        self.contenLabel.font = [UIFont systemFontOfSize:13];
        self.contenLabel.text = @"美容,春季,草莓味,饮品,下午茶,减肥,瘦身,养胃,调理肠胃,促消化,胃炎,消化不良,乳腺增生,肥胖";
        self.contenLabel.numberOfLines = 0;
        self.contenLabel.textAlignment = NSTextAlignmentCenter;
        self.contenLabel.layer.masksToBounds = YES;
        self.contenLabel.layer.cornerRadius = 15.0;
        self.contenLabel.textColor = [UIColor blackColor];
        self.contenLabel.numberOfLines = 8;
        self.contenLabel.backgroundColor = newBackGroundGray;
        
        self.stepLabel = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.stepLabel setTitle:@"点击菜谱了解更多->" forState:UIControlStateNormal];
        self.stepLabel.tintColor = [UIColor grayColor];

        self.stepButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.stepButton setImage:[UIImage imageNamed:@"shu.png"] forState:UIControlStateNormal];
        // 在自定义cell里将button添加到contenview才能实现点击事件，查看图层问题得知
        
        [self addSubview:self.foodNameLabel];
        [self addSubview:self.peopelNumLabel];
        [self addSubview:self.foodImageView];
        [self addSubview:self.cookingtimeLabel];
        [self addSubview:self.menuLabel];
        [self addSubview:self.tagLabel];
        [self addSubview:self.authorLabel];
        [self addSubview:self.contenLabel];
        [self addSubview:self.lineView];
        [self addSubview:self.stepLabel];
        [self.contentView addSubview:self.stepButton];
    }
    return self;
}
- (void)layoutSubviews {
    [self.foodNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.left.equalTo(self).offset(12);
        make.width.equalTo(@(ScreenWidth / 4 * 3));
    }];
    [self.peopelNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.foodNameLabel mas_bottom]).offset(10);
        make.left.equalTo(self).offset(14);
    }];
    [self.cookingtimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.foodNameLabel mas_bottom]).offset(10);
        make.left.equalTo([self.peopelNumLabel mas_right]).offset(5);
    }];
    [self.menuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.cookingtimeLabel mas_bottom]).offset(15);
        make.left.equalTo(@12);
        make.height.equalTo(@25);
        make.width.equalTo(@(ScreenWidth / 5 - 5));
    }];
    [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.menuLabel mas_bottom]).offset(8);
        make.left.equalTo([self.menuLabel mas_left]).offset(5);
        make.width.equalTo(@(ScreenWidth / 3 * 2 + 20));
    }];
    [self.foodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(2);
        make.right.equalTo(@-11);
        make.width.equalTo(@92);
        make.height.equalTo(@92);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo([self.contentView mas_bottom]).offset(-1);
        make.height.equalTo(@2.5);
        make.left.equalTo(@0);
        make.width.equalTo(@(ScreenWidth));
    }];
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.tagLabel mas_bottom]).offset(10);
        make.left.equalTo(@(ScreenWidth / 2 - 40));
        make.height.equalTo(@25);
        make.width.equalTo(@(ScreenWidth / 5 - 5));
    }];
    [self.contenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.authorLabel mas_bottom]).offset(8);
        make.left.equalTo(@20);
        make.width.equalTo(@(ScreenWidth - 40));
    }];
    [self.stepLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.bottom.equalTo(@-25);
        make.left.equalTo(@(ScreenWidth / 4));
    }];
    [self.stepButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-30);
        make.left.equalTo([self.stepLabel mas_right]).offset(10);
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
}
- (void)pressstepButton {
    NSLog(@"toMenuDetailsView");
}
@end
