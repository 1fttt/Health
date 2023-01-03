//
//  FoodSecondTableViewCell.h
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FoodSecondTableViewCell : UITableViewCell
@property (nonatomic, strong)UIView *backWhiteView;
@property (nonatomic, strong)UIView *backGrayView;
@property (nonatomic, strong)UIView *lineView;

@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *hunderedLabel;
@property (nonatomic, strong)UILabel *nutritionLabel;
@property (nonatomic, strong)UILabel *contentLabel;
@property (nonatomic, strong)UILabel *proteinTitleLabel;
// 五大营养详细
@property (nonatomic, strong)UILabel *proteinLabel;
@property (nonatomic, strong)UILabel *fatLabel;
@property (nonatomic, strong)UILabel *carbohydrateLabel;
@property (nonatomic, strong)UILabel *natriumLabel;
@property (nonatomic, strong)UILabel *fiberDietaryLabel;
// 高阶数据
@property (nonatomic, strong)UILabel *glycemicInfoDataLabel;
@property (nonatomic, strong)UILabel *bigjourleTitleLabel;
@property (nonatomic, strong)UILabel *bigJoueleLabel;
@property (nonatomic, strong)UILabel *jouleLabel;
@property (nonatomic, strong)UIView *lineOnGrayBackView;
@property (nonatomic, strong)UILabel *runLabel;

@end

NS_ASSUME_NONNULL_END
