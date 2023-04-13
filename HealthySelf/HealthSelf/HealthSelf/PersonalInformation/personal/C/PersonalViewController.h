//
//  PersonalViewController.h
//  HealthSelf
//
//  Created by 张佳慧 on 2023/1/10.
//

#import <UIKit/UIKit.h>
#import "PersonalView.h"
#import "PersonalModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface PersonalViewController : UIViewController
@property (nonatomic, strong)PersonalView* personalView;
@property (nonatomic, strong)PersonalModel* personalModel;
@end

NS_ASSUME_NONNULL_END
