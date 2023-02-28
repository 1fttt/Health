//
//  MoreMenuView.h
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol returnButtonDelegate <NSObject>

- (void)returnButton:(UIButton *)button;

@end
@interface MoreMenuView : UIView
- (void)viewInit;
@property (nonatomic, strong)UITextField *searchMenuTextField;
@property (nonatomic, strong)UIImageView *searchImageView;

@property (nonatomic, strong)UIButton *searchMenuButton;
@property (nonatomic, weak)id <returnButtonDelegate>MenuButtonDelegate;

// 大家都在搜
@property (nonatomic, strong)UILabel *usersLabel;
@property (nonatomic, copy)NSArray *majoritySearchFoodArray;
@property (nonatomic, strong)UIButton *majorySearchFoodButton;


@end

NS_ASSUME_NONNULL_END
