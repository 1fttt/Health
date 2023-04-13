//
//  DietPlanView.h
//  HealthSelf
//
//  Created by 张佳慧 on 2023/2/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DietPlanView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIButton* backButton;
@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, strong)NSMutableArray* arrayData;
@end

NS_ASSUME_NONNULL_END
