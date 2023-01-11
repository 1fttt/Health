//
//  FoodDetailsView.h
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FoodDetailsView : UIView<UITableViewDelegate, UITableViewDataSource>
- (void)initView;
// 食物详细信息
@property (nonatomic, strong)NSDictionary *foodDetailsDiciionary;
@property (nonatomic, strong)UITableView *foodDetailsTableView;
@end

NS_ASSUME_NONNULL_END
