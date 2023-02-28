//
//  CommentTableViewCell.h
//  HealthSelf
//
//  Created by 李育腾 on 2023/2/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *userImgView;
@property (nonatomic, strong) UILabel *userIdLabel;
@property (nonatomic, strong)UIButton *moreMenuButton;
@property (nonatomic, strong) UILabel *userTitleLabel;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UIImageView *textImgView;
@property (nonatomic, strong) UILabel *timeLabel;
@end

NS_ASSUME_NONNULL_END
