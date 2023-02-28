//
//  EditView.h
//  HealthSelf
//
//  Created by 李育腾 on 2023/2/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol buttonDelegate <NSObject>

- (void)returnButton:(UIButton *) button;

@end
@interface EditView : UIView
- (void)viewInit;
@property (nonatomic, weak) id<buttonDelegate>delegate;
@property (nonatomic, strong) UIImageView *imageViewAvatar;
// 标题部分
@property (nonatomic, strong) UITextField *titleTextField;

@end

NS_ASSUME_NONNULL_END
