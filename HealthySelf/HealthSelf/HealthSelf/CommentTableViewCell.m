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
@property (nonatomic, strong) UIImageView *userImgView;
@property (nonatomic, strong) UILabel *userIdLabel;
@property (nonatomic, strong) UILabel *userTitleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *textImgView;
@property (nonatomic, strong) UILabel *commentLabel;
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
        self.userIdLabel.text = @"詹姆斯的第五个冠军";
        self.userIdLabel.font = [UIFont systemFontOfSize:15];
        self.userIdLabel.textColor = [UIColor blackColor];
        
        [self.contentView addSubview:self.userImgView];
        [self.contentView addSubview:self.userIdLabel];
        
//        [self.contentView layoutIfNeeded];
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
}
@end
