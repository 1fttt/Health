//
//  ViewRegister.h
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol delegateRegisterButton <NSObject>

- (void)returnButton:(UIButton *)button;

@end
@interface RegisterView : UIView<UITextFieldDelegate>
@property (nonatomic, strong)UILabel *labelTitle;

@property (nonatomic, strong) UITextField *textFieldPassWord;
@property (nonatomic, strong) UITextField *textFieldSurePassWord;
@property (nonatomic, strong) UITextField *textFieldTelNumber;
@property (nonatomic, strong) UITextField *textFieldVerificationCode;

@property (nonatomic, strong) UIImageView *imageViewUserName;
@property (nonatomic, strong) UIImageView *imageViewPassWord;

@property (nonatomic, strong) UIButton *buttontRegister;
@property (nonatomic, strong) UIButton *buttonSendVerificationCode;

- (void)viewInit;
@property (nonatomic, weak) id<delegateRegisterButton>delegate;
@end

NS_ASSUME_NONNULL_END
