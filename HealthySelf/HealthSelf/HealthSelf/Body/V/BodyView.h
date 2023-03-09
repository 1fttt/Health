//
//  ViewBody.h
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BodyView : UIView
- (void)viewInit;
@property (nonatomic, strong) UILabel *crtWtNumLabel;
@property (nonatomic, copy) NSArray *weightArray;

@end

NS_ASSUME_NONNULL_END
