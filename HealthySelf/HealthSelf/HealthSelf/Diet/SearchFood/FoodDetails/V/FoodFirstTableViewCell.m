//
//  FoodFirstTableViewCell.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/1.
//

#import "FoodFirstTableViewCell.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@implementation FoodFirstTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    UIColor *newBackGroundGreen = [UIColor colorWithRed:134 / 255.0f green: 205 / 255.0f blue: 196 / 255.0f alpha:1.0];
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backView = [[UIView alloc] init];
        self.backView.backgroundColor = [UIColor whiteColor];
        self.backView.layer.masksToBounds = YES;
        self.backView.layer.cornerRadius = 16.0;
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.text = @"营养档案-基础热量";
        self.titleLabel.font = [UIFont systemFontOfSize:17];
        
        
        self.foodNameLabel = [[UILabel alloc] init];
        self.foodNameLabel.text = @"米饭";
        self.foodNameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        
        self.recommendLabel = [[UILabel alloc] init];
        self.recommendLabel.text = @"绿灯食物: 推荐食用";
        self.recommendLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
         
        self.foodColorView = [[UIView alloc] init];
        self.foodColorView.layer.masksToBounds = YES;
        self.foodColorView.layer.cornerRadius = 2.5;
        self.foodColorView.backgroundColor = [UIColor redColor];
        
        self.caloryLabel = [[UILabel alloc] init];
        self.caloryLabel.layer.masksToBounds = YES;
        self.caloryLabel.text = @"116千卡";
        self.caloryLabel.layer.cornerRadius = 10.0;
        self.caloryLabel.font = [UIFont systemFontOfSize:15];
        self.caloryLabel.backgroundColor = newBackGroundGreen;
        
        self.jouleLabel = [[UILabel alloc] init];
        self.jouleLabel.layer.masksToBounds = YES;
        self.jouleLabel.text = @"467千焦";
        self.jouleLabel.layer.cornerRadius = 10.0;
        self.jouleLabel.font = [UIFont systemFontOfSize:15];
        self.jouleLabel.backgroundColor = newBackGroundGreen;
        
        self.hundredLabel = [[UILabel alloc] init];
        self.hundredLabel.text = @"(每100克可食用部)";
        self.hundredLabel.textColor = [UIColor grayColor];
        self.hundredLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        
        self.hundredLabel2 = [[UILabel alloc] init];
        self.hundredLabel2.text = @"(每100克可食用部)";
        self.hundredLabel2.textColor = [UIColor grayColor];
        self.hundredLabel2.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        
        
        [self addSubview:self.backView];
        [self.backView addSubview:self.hundredLabel];
        [self.backView addSubview:self.hundredLabel2];
        [self.backView addSubview:self.jouleLabel];
        [self.backView addSubview:self.caloryLabel];
        [self.backView addSubview:self.foodColorView];
        [self.backView addSubview:self.titleLabel];
        [self.backView addSubview:self.foodNameLabel];
        [self.backView addSubview:self.recommendLabel];
        
        
    }
    return self;
}
- (void)layoutSubviews {
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@30);
        make.width.equalTo(@(ScreenWidth - 60));
        make.height.equalTo(@(ScreenHeight / 4 - 10));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.width.equalTo(@150);
        make.left.equalTo(@20);
    }];
    [self.foodNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.titleLabel mas_bottom]).offset(15);
        make.width.equalTo(@200);
        make.left.equalTo([self.titleLabel mas_left]).offset(2);
    }];
    [self.foodColorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.foodNameLabel mas_bottom]).offset(20);
        make.width.equalTo(@5);
        make.height.equalTo(@5);
        make.left.equalTo([self.titleLabel mas_left]).offset(2);
        
    }];
    [self.recommendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.foodNameLabel mas_bottom]).offset(15);
        make.width.equalTo(@200);
        make.left.equalTo([self.foodColorView mas_right]).offset(5);
    }];
    [self.caloryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.recommendLabel mas_bottom]).offset(15);
        make.left.equalTo([self.titleLabel mas_left]).offset(2);
        make.height.equalTo(@23);
    }];
    [self.jouleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.caloryLabel mas_bottom]).offset(15);
        make.left.equalTo([self.titleLabel mas_left]).offset(2);
        make.height.equalTo(@23);
    }];
    [self.hundredLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.caloryLabel mas_bottom]).offset(18);
        make.left.equalTo([self.jouleLabel mas_right]).offset(5);
    }];
    [self.hundredLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.recommendLabel mas_bottom]).offset(18);
        make.left.equalTo([self.caloryLabel mas_right]).offset(5);
    }];
    
}
@end
