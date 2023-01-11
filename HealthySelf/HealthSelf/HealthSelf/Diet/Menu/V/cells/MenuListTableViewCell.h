//
//  MenuListTableViewCell.h
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuListTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *foodNameLabel;
@property (nonatomic, strong) UILabel *peopelNumLabel;
@property (nonatomic, strong) UILabel *cookingtimeLabel;
@property (nonatomic, strong) UILabel *tagLabel;

@property (nonatomic, strong) UILabel *contenLabel;
@property (nonatomic, strong) UILabel *authorLabel;

@property (nonatomic, strong) UILabel *menuLabel;
@property (nonatomic, strong) UIImageView* foodImageView;
@property (nonatomic, strong) UIButton *stepLabel;
@property (nonatomic, strong) UIButton *stepButton;
@property (nonatomic, strong)UIView *lineView;
@end

NS_ASSUME_NONNULL_END
