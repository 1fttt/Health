//
//  FoodFirstTableViewCell.h
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FoodFirstTableViewCell : UITableViewCell
@property (nonatomic, strong)UIView *backView;
@property (nonatomic, strong)UIView *foodColorView;

@property (nonatomic, strong)UILabel *foodNameLabel;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *recommendLabel;
@property (nonatomic, strong)UILabel *caloryLabel;
@property (nonatomic, strong)UILabel *jouleLabel;
@property (nonatomic, strong)UILabel *hundredLabel;
@property (nonatomic, strong)UILabel *hundredLabel2;


@property (nonatomic, strong)UIButton *collectionButton;

@end

NS_ASSUME_NONNULL_END
