//
//  FoodOutlineTableViewCell.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/6.
//

#import "FoodOutlineTableViewCell.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface FoodOutlineTableViewCell()
@property (nonatomic, strong)UIView *lineView;
@end

@implementation FoodOutlineTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIColor *newBackGroundGreen = [UIColor colorWithRed:134 / 255.0f green: 205 / 255.0f blue: 196 / 255.0f alpha:1.0];
        UIColor *newBackGroundGreen2 = [UIColor colorWithRed:127 / 255.0f green: 200 / 255.0f blue: 190 / 255.0f alpha:1.0];
        self.foodNameLabel = [[UILabel alloc] init];
        self.foodNameLabel.text = @"米饭";
        self.foodNameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
        
        self.hunderedLabel = [[UILabel alloc] init];
        self.hunderedLabel.text = @"(每100克可食部)";
        self.hunderedLabel.font = [UIFont systemFontOfSize:12];
        self.hunderedLabel.textColor = [UIColor grayColor];
        
        self.runLabel = [[UILabel alloc] init];
        self.runLabel.text = @"大约需要走5150步";
        self.runLabel.textColor = [UIColor grayColor];
        self.runLabel.font = [UIFont systemFontOfSize:12];
        
        
        self.caloryLabel = [[UILabel alloc] init];
        self.caloryLabel.layer.masksToBounds = YES;
        self.caloryLabel.text = @"116千卡";
        self.caloryLabel.layer.cornerRadius = 10.0;
        self.caloryLabel.font = [UIFont systemFontOfSize:15];
        self.caloryLabel.textAlignment = NSTextAlignmentCenter;
        self.caloryLabel.backgroundColor = newBackGroundGreen;
        
        self.healthLevel = [[UILabel alloc] init];
        self.healthLevel.textColor = [UIColor redColor];
        self.healthLevel.text = @"健康等级：1";
        self.healthLevel.font = [UIFont systemFontOfSize:15];
        
        self.lineView = [[UIView alloc] init];
        self.lineView.backgroundColor = [UIColor grayColor];
        
        self.recordButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.recordButton.layer.masksToBounds = YES;
        self.recordButton.layer.cornerRadius = 14.0;
        [self.recordButton setTitle:@"收藏" forState:UIControlStateNormal];
        self.tintColor = [UIColor whiteColor];
        self.recordButton.backgroundColor = newBackGroundGreen2;
        
        [self addSubview:self.foodNameLabel];
        [self addSubview:self.hunderedLabel];
        [self addSubview:self.runLabel];
        [self addSubview:self.caloryLabel];
        [self addSubview:self.healthLevel];
        [self addSubview:self.lineView];
        [self addSubview:self.recordButton];
    }
    return self;
}
- (void)layoutSubviews {
    [self.foodNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@15);
    }];
    [self.hunderedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@12);
        make.left.equalTo([self.foodNameLabel mas_right]).offset(10);
    }];
    [self.runLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.contentView mas_bottom]).offset(-20);
        make.left.equalTo(@(ScreenWidth / 3));
    }];
    [self.caloryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.foodNameLabel mas_bottom]).offset(10);
        make.left.equalTo(@55);
        make.width.equalTo(@100);
        make.height.equalTo(@25);
    }];
    [self.healthLevel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.caloryLabel mas_bottom]).offset(10);
        make.left.equalTo(@55);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo([self.contentView mas_bottom]).offset(-1);
        make.height.equalTo(@0.5);
        make.left.equalTo(@10);
        make.width.equalTo(@(ScreenWidth - 20));
    }];
    [self.recordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo([self.contentView mas_right]).offset(-100);
        make.height.equalTo(@30);
        make.width.equalTo(@70);
    }];
}
@end
