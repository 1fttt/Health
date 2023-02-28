//
//  SetView.h
//  HealthSelf
//
//  Created by 张佳慧 on 2022/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SetView : UIView<UITableViewDelegate,UITableViewDataSource> {
    UITableView* _tableView;
    NSMutableArray* _arrayData;
}
@property (nonatomic, strong)UIButton* backButton;
@property (nonatomic, strong)UITableView* UITableView;
@property (nonatomic, strong)NSArray* textArray;
- (void)initTableView;
@end

NS_ASSUME_NONNULL_END
