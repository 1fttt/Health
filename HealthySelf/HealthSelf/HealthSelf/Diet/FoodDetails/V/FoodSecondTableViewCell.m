//
//  FoodSecondTableViewCell.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/1.
//

#import "FoodSecondTableViewCell.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@implementation FoodSecondTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIColor *newBackGroundGray = [UIColor colorWithRed:246 / 255.0f green: 247 / 255.0f blue: 250 / 255.0f alpha:1.0];
        UIColor *newBackGroundGreen = [UIColor colorWithRed:134 / 255.0f green: 205 / 255.0f blue: 196 / 255.0f alpha:1.0];
        self.backWhiteView = [[UIView alloc] init];
        self.backWhiteView.backgroundColor = [UIColor whiteColor];
        self.backWhiteView.layer.masksToBounds = YES;
        self.backWhiteView.layer.cornerRadius = 16.0;
        
        self.backGrayView = [[UIView alloc] init];
        self.backGrayView.backgroundColor = [UIColor grayColor];
        self.backGrayView.layer.masksToBounds = YES;
        self.backGrayView.backgroundColor = newBackGroundGray;
        self.backGrayView.layer.cornerRadius = 16.0;
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.text = @"营养成分细致表";
        self.titleLabel.font = [UIFont systemFontOfSize:17];
        
        self.hunderedLabel = [[UILabel alloc] init];
        self.hunderedLabel.text = @"每100克可食部";
        self.hunderedLabel.font = [UIFont systemFontOfSize:12];
        self.hunderedLabel.textColor = [UIColor grayColor];
        
        self.nutritionLabel = [[UILabel alloc] init];
        self.nutritionLabel.text = @"营养元素";
        self.nutritionLabel.font = [UIFont systemFontOfSize:15];
        self.nutritionLabel.textColor = [UIColor grayColor];
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.text = @"含量";
        self.contentLabel.font = [UIFont systemFontOfSize:15];
        self.contentLabel.textColor = [UIColor grayColor];
        
        self.proteinLabel = [[UILabel alloc] init];
        self.proteinLabel.text = @"12.7克";
        self.proteinLabel.font = [UIFont systemFontOfSize:16];
        
        self.fatLabel = [[UILabel alloc] init];
        self.fatLabel.text = @"1.7克";
        self.fatLabel.font = [UIFont systemFontOfSize:16];
        
        self.carbohydrateLabel = [[UILabel alloc] init];
        self.carbohydrateLabel.text = @"1.7克";
        self.carbohydrateLabel.font = [UIFont systemFontOfSize:16];
        
        self.natriumLabel = [[UILabel alloc] init];
        self.natriumLabel.text = @"12.7毫克";
        self.natriumLabel.font = [UIFont systemFontOfSize:16];
        
        self.fiberDietaryLabel = [[UILabel alloc] init];
        self.fiberDietaryLabel.text = @"9.0毫克";
        self.fiberDietaryLabel.font = [UIFont systemFontOfSize:16];
        
        self.bigjourleTitleLabel = [[UILabel alloc] init];
        self.bigjourleTitleLabel.text = @"热量:";
        self.bigjourleTitleLabel.textColor = [UIColor grayColor];
        self.bigjourleTitleLabel.font = [UIFont systemFontOfSize:12];
        
        self.bigJoueleLabel = [[UILabel alloc] init];
        self.bigJoueleLabel.text = @"155";
        self.bigJoueleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:27];
        
        self.jouleLabel = [[UILabel alloc] init];
        self.jouleLabel.layer.masksToBounds = YES;
        self.jouleLabel.text = @"千焦";
        self.jouleLabel.layer.cornerRadius = 10.0;
        self.jouleLabel.font = [UIFont systemFontOfSize:14];
        self.jouleLabel.textColor = [UIColor whiteColor];
        self.jouleLabel.backgroundColor = newBackGroundGreen;
        self.jouleLabel.textAlignment =  NSTextAlignmentCenter;
        
        self.lineOnGrayBackView = [[UIView alloc] init];
        self.lineOnGrayBackView.backgroundColor = [UIColor grayColor];
        
        self.runLabel = [[UILabel alloc] init];
        self.runLabel.text = @"大约需要走5150步";
        self.runLabel.textColor = [UIColor grayColor];
        self.runLabel.font = [UIFont systemFontOfSize:12];
        
        [self addSubview:self.backWhiteView];
        [self.backWhiteView addSubview:self.backGrayView];
        [self.backWhiteView addSubview:self.hunderedLabel];
        [self.backWhiteView addSubview:self.titleLabel];
        [self.backWhiteView addSubview:self.nutritionLabel];
        [self.backWhiteView addSubview:self.contentLabel];
        [self.backWhiteView addSubview:self.proteinLabel];
        [self.backWhiteView addSubview:self.fatLabel];
        [self.backWhiteView addSubview:self.carbohydrateLabel];
        [self.backWhiteView addSubview:self.natriumLabel];
        [self.backWhiteView addSubview:self.fiberDietaryLabel];
        
        [self.backGrayView addSubview:self.bigjourleTitleLabel];
        [self.backGrayView addSubview:self.bigJoueleLabel];
        [self.backGrayView addSubview:self.jouleLabel];
        [self.backGrayView addSubview:self.lineOnGrayBackView];
        [self.backGrayView addSubview:self.runLabel];
        
    }
    return self;
}
- (void)layoutSubviews {
    UIColor *newBackGroundGray = [UIColor colorWithRed:246 / 255.0f green: 247 / 255.0f blue: 250 / 255.0f alpha:1.0];
    [self.backWhiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@30);
        make.height.equalTo(@(ScreenHeight / 4 * 3));
        make.width.equalTo(@(ScreenWidth - 60));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.width.equalTo(@150);
        make.left.equalTo(@20);
    }];
    [self.hunderedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo([self.titleLabel mas_right]).offset(40);
        make.top.equalTo(@15);
        make.width.equalTo(@200);
    }];
    [self.backGrayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.titleLabel mas_bottom]).offset(15);
        make.width.equalTo(@(ScreenWidth - 100));
        make.left.equalTo(@20);
        make.height.equalTo(@(ScreenHeight / 4 - 30));
    }];
    [self.nutritionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(([self.backGrayView mas_bottom])).offset(15);
        make.left.equalTo(@15);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(([self.backGrayView mas_bottom])).offset(15);
        make.left.equalTo([self.nutritionLabel mas_right]).offset(120);
    }];
    
    NSArray *titleArray = @[@"蛋白质", @"脂肪", @"碳水化合物", @"纳", @"膳食纤维"];
    for (int i = 0; i < 5; i++) {
        self.proteinTitleLabel = [[UILabel alloc] init];
        [self.backWhiteView addSubview:self.proteinTitleLabel];
        self.proteinTitleLabel.text = titleArray[i];
        self.proteinTitleLabel.font = [UIFont systemFontOfSize:16];
        [self.proteinTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([self.nutritionLabel mas_bottom]).offset(i * 50  + 25);
            make.left.equalTo(@15);
        }];
        
        self.lineView = [[UIView alloc] init];
        self.lineView.backgroundColor = newBackGroundGray;
        [self.backWhiteView addSubview:self.lineView];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@5);
            make.top.equalTo([self.nutritionLabel mas_bottom]).offset(i * 45 + 18);
            make.height.equalTo(@1);
            make.width.equalTo(@(ScreenWidth - 70));
        }];
    }
    [self.proteinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.contentLabel mas_bottom]).offset(25);
        make.left.equalTo([self.contentLabel mas_left]).offset(2);
    }];
    [self.fatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.proteinLabel mas_bottom]).offset(30);
        make.left.equalTo([self.contentLabel mas_left]).offset(2);
    }];
    [self.carbohydrateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.fatLabel mas_bottom]).offset(30);
        make.left.equalTo([self.contentLabel mas_left]).offset(2);
    }];
    [self.natriumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.carbohydrateLabel mas_bottom]).offset(30);
        make.left.equalTo([self.contentLabel mas_left]).offset(2);
    }];
    [self.fiberDietaryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.natriumLabel mas_bottom]).offset(30);
        make.left.equalTo([self.contentLabel mas_left]).offset(2);
    }];
    [self.bigjourleTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@10);
    }];
    [self.bigJoueleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@60);
        make.left.equalTo([self.bigjourleTitleLabel mas_right]).offset(5);
    }];
    [self.jouleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.bigJoueleLabel mas_bottom]).offset(10);
        make.left.equalTo([self.bigJoueleLabel mas_left]).offset(-1);
        make.width.equalTo(@44);
    }];
    [self.lineOnGrayBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.bigjourleTitleLabel mas_bottom]).offset(10);
        make.left.equalTo([self.jouleLabel mas_right]).offset(60);
        make.width.equalTo(@0.3);
        make.height.equalTo(@(ScreenHeight / 8 - 15));
    }];
    [self.runLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.lineOnGrayBackView mas_bottom]).offset(10);
        make.left.equalTo([self.jouleLabel mas_right]).offset(2);

    }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
