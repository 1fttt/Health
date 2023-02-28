//
//  MaterialTableViewCell.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/12.
//

#import "MaterialTableViewCell.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@implementation MaterialTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    UIColor *newBackGroundGreen = [UIColor colorWithRed:127 / 255.0f green: 200 / 255.0f blue: 190 / 255.0f alpha:1.0];
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIColor *labelGreen = [UIColor colorWithRed:124 / 255.0f green:193 / 255.0f blue:156 / 255.0f alpha:1.0];
        self.backView = [[UIView alloc] init];
        self.backView.backgroundColor = [UIColor whiteColor];
        self.backView.layer.masksToBounds = YES;
        self.backView.layer.cornerRadius = 16.0;

        self.menuImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fruit.png"]];
        self.menuImageView.layer.borderWidth = 0.1;
        self.menuImageView.layer.borderColor = [UIColor grayColor].CGColor;
        self.menuImageView.layer.masksToBounds = YES;
        self.menuImageView.layer.cornerRadius = 16;

        self.menuNameLabel = [[UILabel alloc] init];
        self.menuNameLabel.text = @"鲜肉馄饨";
        self.menuNameLabel.numberOfLines = 0;
        self.menuNameLabel.font = [UIFont systemFontOfSize:16];

        self.ingredientsListTitleLabel = [[UILabel alloc] init];
        self.ingredientsListTitleLabel.text = @"食材清单";
        self.ingredientsListTitleLabel.font = [UIFont systemFontOfSize:17];

        self.materialsTitleLabel = [[UILabel alloc] init];
        self.materialsTitleLabel.text = @"主要原料";
        self.materialsTitleLabel.textColor = [UIColor grayColor];
        self.materialsTitleLabel.font = [UIFont systemFontOfSize:14];

        self.recordButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.recordButton.layer.masksToBounds = YES;
        self.recordButton.layer.cornerRadius = 12.0;
        [self.recordButton setTitle:@"记菜谱" forState:UIControlStateNormal];
        self.tintColor = [UIColor whiteColor];
        self.recordButton.backgroundColor = labelGreen;

        [self addSubview:self.backView];
        [self.backView addSubview:self.menuImageView];
        [self.backView addSubview:self.menuNameLabel];
        [self.backView addSubview:self.ingredientsListTitleLabel];
        [self.backView addSubview:self.materialsTitleLabel];
        [self.backView addSubview:self.recordButton];
    }
    return self;
}
- (void)layoutSubviews {
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@30);
        make.width.equalTo(@(ScreenWidth - 60));
        make.height.equalTo([self.contentView mas_height]);
    }];
    [self.menuImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@10);
        make.width.equalTo(@60);
        make.height.equalTo(@60);
    }];
    [self.menuNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@25);
        make.left.equalTo([self.menuImageView mas_right]).offset(10);
        make.width.equalTo(@(ScreenWidth / 3));
    }];
    [self.ingredientsListTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.menuImageView mas_bottom]).offset(10);
        make.left.equalTo(@10);
    }];
    [self.materialsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.ingredientsListTitleLabel mas_bottom]).offset(10);
        make.left.equalTo(@10);
    }];
    [self.recordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@25);
        make.right.equalTo(@-25);
        make.height.equalTo(@25);
        make.width.equalTo(@70);
    }];
   
  
    
}
@end
