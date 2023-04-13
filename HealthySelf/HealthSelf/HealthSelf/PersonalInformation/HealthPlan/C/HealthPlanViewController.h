//
//  HealthPlanViewController.h
//  HealthSelf
//
//  Created by 张佳慧 on 2023/2/3.
//

#import <UIKit/UIKit.h>
#import "HealthPlanView.h"
#import "HealthPlanModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HealthPlanViewController : UIViewController
@property (nonatomic, strong)HealthPlanView* healthView;
@property (nonatomic, strong)HealthPlanModel* healthModel;
@end

NS_ASSUME_NONNULL_END
