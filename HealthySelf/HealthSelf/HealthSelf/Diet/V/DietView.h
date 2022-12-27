//
//  VIewDiet.h
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DietView : UIView <UITextFieldDelegate>
@property (nonatomic, strong)UILabel *labelHealth;
@property (nonatomic, strong)UIView *backView;

@property (nonatomic, strong)UITextField *SearchTextFiled;
@property (nonatomic, strong)UIImageView *searchImageView;
- (void)viewInit;
@end

NS_ASSUME_NONNULL_END
