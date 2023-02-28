//
//  MenuDetailsView.h
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuDetailsView : UIView
- (void)viewInit;
@property (nonatomic, strong)NSDictionary *menuMaterialDiciionary;
@property (nonatomic, strong)NSDictionary *menuStepDictionary;
@end

NS_ASSUME_NONNULL_END
