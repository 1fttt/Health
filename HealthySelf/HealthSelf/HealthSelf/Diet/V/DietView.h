//
//  VIewDiet.h
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MoreButtonDelegate <NSObject>
- (void)returnMoreButtonTag:(UIButton *)MoreButton;
@end

@protocol MenuButtonDelegate <NSObject>
- (void)returnMenuButtonTag:(UIButton *)MenuButton;
@end

@interface DietView : UIView <UITextFieldDelegate>
@property (nonatomic, strong)UILabel *labelHealth;
@property (nonatomic, strong)UIView *backView;

@property (nonatomic, strong)UITextField *SearchTextFiled;
@property (nonatomic, strong)UIImageView *searchImageView;

@property (nonatomic, strong)UIButton *moreButton;
@property (nonatomic, strong)UILabel *moreLabel;
@property (nonatomic, weak)id <MoreButtonDelegate>moreButtonDelegate;

// 菜谱功能
@property (nonatomic, strong)UILabel *menuLabel;

@property (nonatomic, strong)UIView *menuBackView;
@property (nonatomic, strong)UIView *menuBackView2;

@property (nonatomic, strong)UIView *menuLineView;
@property (nonatomic, strong)UIView *menuLineView2;
@property (nonatomic, strong)NSDictionary *menuDicit1;
@property (nonatomic, strong)NSDictionary *menuDicit2;
@property (nonatomic, strong)UIButton *menuButton1;
@property (nonatomic, strong)UIButton *menuButton2;
@property (nonatomic, strong)UIButton *moreMenuButton;
@property (nonatomic, strong)UILabel *weatherLabel;
@property (nonatomic, weak)id <MenuButtonDelegate>menuButtonDelegate;
- (void)creatMenuDetails;
- (void)viewInit;
@end

NS_ASSUME_NONNULL_END
