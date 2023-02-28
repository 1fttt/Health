//
//  MenuStepsTableViewCell.h
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuStepsTableViewCell : UITableViewCell
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UILabel *peopelNumLabel;
@property (nonatomic, strong) UILabel *cookingtimeLabel;
@property (nonatomic, strong) UIImageView *stepImageView;
@property (nonatomic, strong) UILabel *stepLabel;
@end

NS_ASSUME_NONNULL_END
