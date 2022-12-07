//
//  ViewControllerRegister.h
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/5.
//

#import <UIKit/UIKit.h>
#import "ViewRegister.h"
NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerRegister : UIViewController<delegateRegisterButton>
- (void)returnButton:(UIButton *)button;
@end

NS_ASSUME_NONNULL_END
