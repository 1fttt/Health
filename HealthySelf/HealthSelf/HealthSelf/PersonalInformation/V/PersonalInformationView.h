//
//  PersonalInformationView.h
//  HealthSelf
//
//  Created by 张佳慧 on 2022/12/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol PersonalInformationViewDelegate <NSObject>
-(void)jumpView:(long)tag;

@end
@interface PersonalInformationView : UIView<UITableViewDelegate,UITableViewDataSource> {
    UITableView* _tableView;
    NSMutableArray* _arrayData;
}
@property (nonatomic, strong)UIButton* setButton;
@property (nonatomic, strong)UIButton* messageButton;
@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, strong)NSMutableArray* arrayData;

@property (nonatomic, assign)id<PersonalInformationViewDelegate>delegate;
-(void)initTableView;
@end

NS_ASSUME_NONNULL_END
