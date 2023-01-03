//
//  SearchFoodView.h
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol returnButtonDelegate <NSObject>

- (void)returnButton:(UIButton *)button;

@end
@protocol returnFoodNameDelegate <NSObject>

- (void)returnFoodName:(NSString *)foodIdString;

@end
@interface SearchFoodView : UIView <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
- (void)viewInit;
@property (nonatomic, strong)UITextField *SearchTextFiled;
@property (nonatomic, strong)UIImageView *searchImageView;

@property (nonatomic, strong)UIButton *exitButton;
@property (nonatomic, weak)id<returnButtonDelegate>ExitDelegate;

// 大家都在搜
@property (nonatomic, strong)UILabel *usersLabel;
@property (nonatomic, copy)NSArray *majoritySearchFoodArray;
@property (nonatomic, strong)UIButton *majorySearchFoodButton;

// 关键字搜素tableView和水果id name数组
@property (nonatomic, strong)NSMutableArray *keyFoodNameArray;
@property (nonatomic, strong)NSMutableArray *keyFoodIdArray;
@property (nonatomic, strong)UITableView *keyNameTableView;
@property (nonatomic, weak)id<returnFoodNameDelegate>foodDetailsDelegate;

- (void)creatTableView;
@end

NS_ASSUME_NONNULL_END
