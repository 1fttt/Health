//
//  PersonalInformationViewController.h
//  HealthSelf
//
//  Created by 张佳慧 on 2022/12/17.
//

#import <UIKit/UIKit.h>
#import "PersonalInformationView.h"
#import "PersonalInformationModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface PersonalInformationViewController : UIViewController
@property (nonatomic, strong)PersonalInformationView* personalInformationView;
@property (nonatomic, strong)PersonalInformationModel* personalInformationModel;
@end

NS_ASSUME_NONNULL_END
