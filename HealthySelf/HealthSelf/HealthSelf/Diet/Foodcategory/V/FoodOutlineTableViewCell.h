//
//  FoodOutlineTableViewCell.h
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FoodOutlineTableViewCell : UITableViewCell
@property (nonatomic, strong)UILabel *foodNameLabel;
@property (nonatomic, strong)UILabel *caloryLabel;
@property (nonatomic, strong)UILabel *runLabel;
@property (nonatomic, strong)UILabel *healthLevel;
@property (nonatomic, strong)UIButton *collectionLabel;
@property (nonatomic, strong)UILabel *hunderedLabel;
@property (nonatomic, strong)UIButton *recordButton;
@end

NS_ASSUME_NONNULL_END
