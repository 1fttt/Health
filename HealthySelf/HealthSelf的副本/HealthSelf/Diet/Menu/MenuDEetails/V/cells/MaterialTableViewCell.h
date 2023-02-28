//
//  MaterialTableViewCell.h
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MaterialTableViewCell : UITableViewCell
@property (nonatomic, strong)UIView *backView;
@property (nonatomic, strong)UIImageView *menuImageView;
@property (nonatomic, strong)UILabel *menuNameLabel;
@property (nonatomic, strong)UILabel *ingredientsListTitleLabel;
@property (nonatomic, strong)UILabel *materialsTitleLabel;
@property (nonatomic, strong)UIButton *recordButton;
@property (nonatomic, strong)UILabel *materialsLabel;
@property (nonatomic, strong)UIView *lineView;

@property (nonatomic, strong)NSDictionary *menuMaterialDiciionary;
@end

NS_ASSUME_NONNULL_END
