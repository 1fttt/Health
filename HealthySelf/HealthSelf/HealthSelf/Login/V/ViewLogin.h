//
//  ViewLogin.h
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol delegateButton <NSObject>

- (void)returnButton:(UIButton *)button;

@end
@interface ViewLogin : UIView<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textFieldUserName;
@property (nonatomic, strong) UITextField *textFieldPassWord;

@property (nonatomic, strong) UIImageView *imageViewUserName;
@property (nonatomic, strong) UIImageView *imageViewPassWord;


@property (nonatomic, strong) UIButton *buttontLogin;
@property (nonatomic, strong) UIButton *buttontRegister;

@property (nonatomic, copy) NSDictionary* dictionaryUser;

@property (nonatomic, weak)id<delegateButton>delegateButton;
- (void)viewInit;
@end

NS_ASSUME_NONNULL_END
