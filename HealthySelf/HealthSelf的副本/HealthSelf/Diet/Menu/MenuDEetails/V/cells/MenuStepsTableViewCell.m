//
//  MenuStepsTableViewCell.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/12.
//

#import "MenuStepsTableViewCell.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@implementation MenuStepsTableViewCell

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
        UIColor *labelGreen = [UIColor colorWithRed:124 / 255.0f green:193 / 255.0f blue:156 / 255.0f alpha:1.0];
        self.backView = [[UIView alloc] init];
        self.backView.backgroundColor = [UIColor whiteColor];
        self.backView.layer.masksToBounds = YES;
        self.backView.layer.cornerRadius = 18.0;
        
        self.authorLabel = [[UILabel alloc] init];
        self.authorLabel.font = [UIFont systemFontOfSize:13];
        self.authorLabel.text = @"美食做法";
        self.authorLabel.textAlignment = NSTextAlignmentCenter;
        self.authorLabel.layer.masksToBounds = YES;
        self.authorLabel.layer.cornerRadius = 12.0;
        self.authorLabel.textColor = [UIColor whiteColor];
        self.authorLabel.backgroundColor = labelGreen;
        
        self.peopelNumLabel = [[UILabel alloc] init];
        self.peopelNumLabel.font = [UIFont systemFontOfSize:14];
        self.peopelNumLabel.text = @"1-2人";
        self.peopelNumLabel.textColor = [UIColor redColor];
        
        self.cookingtimeLabel = [[UILabel alloc] init];
        self.cookingtimeLabel.font = [UIFont systemFontOfSize:14];
        self.cookingtimeLabel.text = @"准备时间:10分钟";
        self.cookingtimeLabel.textColor = [UIColor grayColor];
        
        
        [self addSubview:self.backView];
        [self.backView addSubview:self.authorLabel];
        [self.backView addSubview:self.peopelNumLabel];
        [self.backView addSubview:self.cookingtimeLabel];
        
        
        
    }
    return self;
}
- (void)layoutSubviews {
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@30);
        make.left.equalTo(@30);
        make.width.equalTo(@(ScreenWidth - 60));
        make.height.equalTo([self.contentView mas_height]);
    }];
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.left.equalTo(@(ScreenWidth / 2 - 70));
        make.height.equalTo(@25);
        make.width.equalTo(@(ScreenWidth / 5 - 5));
    }];
    [self.cookingtimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.authorLabel mas_bottom]).offset(15);
       
        make.left.equalTo(@20);
    }];
    [self.peopelNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.authorLabel mas_bottom]).offset(15);
        make.left.equalTo([self.cookingtimeLabel mas_right]).offset(10);
    }];
    
}
@end
