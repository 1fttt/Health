//
//  HealthPlanView.h
//  HealthSelf
//
//  Created by 张佳慧 on 2023/2/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HealthPlanView : UIView
@property (nonatomic, strong)UIButton* backButton;
@property (nonatomic, strong)UILabel*  bmlDataLabel;
@property (nonatomic, strong)UILabel*  basicDataLabel;
@property (nonatomic, strong)UILabel* lowDataLabel;
@property (nonatomic, strong)UILabel* topDataLabel;
@end

NS_ASSUME_NONNULL_END
