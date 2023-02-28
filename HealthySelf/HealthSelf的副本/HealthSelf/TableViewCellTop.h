//
//  TableViewCellTop.h
//  HealthSelf
//
//  Created by 李育腾 on 2023/2/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCellTop : UITableViewCell<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollview;
@property (nonatomic, strong) NSArray <NSString*> *imageNameList;
@property (nonatomic, strong) UIPageControl* pageControl;
@property (nonatomic, strong) NSTimer* myTimer;
@property (nonatomic, strong) UILabel* labelTitle;
@property (nonatomic, strong) UILabel* labelSmall;
@property (nonatomic, strong) UIImageView* imageViewCurrent;
@property (nonatomic, copy) NSDictionary* dict;
@end

NS_ASSUME_NONNULL_END
