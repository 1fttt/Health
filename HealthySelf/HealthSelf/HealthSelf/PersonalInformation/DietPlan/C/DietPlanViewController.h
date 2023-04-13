//
//  DietPlanViewController.h
//  HealthSelf
//
//  Created by 张佳慧 on 2023/2/3.
//

#import <UIKit/UIKit.h>
#import "DietPlanView.h"
#import "DietPlanModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DietPlanViewController : UIViewController
@property (nonatomic, strong)DietPlanView* dietView;
@property (nonatomic, strong)DietPlanModel* dietModel;
@end

NS_ASSUME_NONNULL_END
