//
//  CommentTableViewCell.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/2/6.
//

#import "CommentTableViewCell.h"
#import <Masonry.h>
#define MaxSize 42
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface CommentTableViewCell()

@end
@implementation CommentTableViewCell

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
        self.userImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_2400.JPG"]];
        self.userImgView.layer.masksToBounds = YES;
        self.userImgView.layer.cornerRadius = MaxSize / 2;
        
        self.userIdLabel = [[UILabel alloc] init];
        self.userIdLabel.text = @"Viper3冲冲冲!";
        self.userIdLabel.font = [UIFont systemFontOfSize:15];
        self.userIdLabel.textColor = [UIColor blackColor];
        
        
        UIColor *newGreen = [UIColor colorWithRed:30 / 255.0f green:183 / 255.0f blue:131 / 255.0f alpha:1.0];
        self.moreMenuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.moreMenuButton setTitle:@"关注" forState:UIControlStateNormal];
        self.moreMenuButton.titleLabel.font = [UIFont systemFontOfSize:14];
        self.moreMenuButton.layer.masksToBounds = YES;
        self.moreMenuButton.layer.cornerRadius = 14;
        self.moreMenuButton.layer.borderWidth = 0.5;
        self.moreMenuButton.tintColor = [UIColor whiteColor];
        self.moreMenuButton.layer.borderColor = [UIColor grayColor].CGColor;
        self.moreMenuButton.backgroundColor = newGreen;
        self.moreMenuButton.tag = 668;
        
        self.userTitleLabel = [[UILabel alloc] init];
        self.userTitleLabel.text = @"健康领域优秀作者";
        self.userTitleLabel.font = [UIFont systemFontOfSize:10];
        self.userTitleLabel.textColor = [UIColor grayColor];
        
        self.commentLabel = [[UILabel alloc] init];
        self.commentLabel.text = @"快乐在发酵，生活在前行，所有的美好都在路上。";
        self.commentLabel.font = [UIFont fontWithName:@"TimesNewRomanPs-BoldItalicMT" size:16];
        self.commentLabel.numberOfLines = 0;
        self.commentLabel.textColor = [UIColor blackColor];
        
        self.textImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WechatIMG414.jpeg"]];
        self.textImgView.layer.masksToBounds = YES;
        self.textImgView.layer.cornerRadius = 5.0;
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.text = @"4小时前";
        self.timeLabel.font = [UIFont systemFontOfSize:11];
        self.timeLabel.textColor = [UIColor grayColor];
        
        [self.contentView addSubview:self.userImgView];
        [self.contentView addSubview:self.userIdLabel];
        [self.contentView addSubview:self.moreMenuButton];
        [self.contentView addSubview:self.userTitleLabel];
        [self.contentView addSubview:self.commentLabel];
        [self.contentView addSubview:self.textImgView];
        [self.contentView addSubview:self.timeLabel];
        
    }
    return self;
}
- (void)layoutSubviews {
    [self.userImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(MaxSize));
        make.height.equalTo(@(MaxSize));
        make.top.equalTo(@15);
        make.left.equalTo(@15);
    }];
    [self.userIdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo([self.userImgView mas_right]).offset(10);
        make.top.equalTo([self.userImgView mas_top]).offset(1);
    }];
    [self.moreMenuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.userImgView mas_top]).offset(3);
        make.right.equalTo(@-20);
        make.width.equalTo(@65);
        make.height.equalTo(@27);
    }];
    [self.userTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo([self.userImgView mas_right]).offset(10);
        make.top.equalTo([self.userIdLabel mas_bottom]).offset(5);
    }];
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo([self.userImgView mas_left]).offset(2);
        make.top.equalTo([self.userImgView mas_bottom]).offset(20);
        make.width.equalTo(@(ScreenWidth / 7 * 6));
    }];
    [self.textImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo([self.userImgView mas_left]).offset(4);
        make.top.equalTo([self.commentLabel mas_bottom]).offset(10);
        make.width.equalTo(@(ScreenWidth / 3 + 20));
        make.height.equalTo(@((ScreenWidth / 3 + 20)* 2));
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo([self.userImgView mas_left]).offset(5);
        make.top.equalTo([self.textImgView mas_bottom]).offset(10);
    }];
}
@end
