//
//  FirstView.h
//  HealthSelf
//
//  Created by 张佳慧 on 2023/4/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstView : UIView
@property(nonatomic, strong)UIScrollView* scrollView;
@property(nonatomic, strong)UISegmentedControl* segmentedControl;
@property(nonatomic, strong)UIButton* backButton;
@end

NS_ASSUME_NONNULL_END
