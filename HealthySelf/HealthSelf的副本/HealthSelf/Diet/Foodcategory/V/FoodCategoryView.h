//
//  FoodCategoryView.h
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface FoodCategoryView : UIView
@property (nonatomic, strong)NSDictionary *foodCateDictionary;
- (void)viewInit;
@end

NS_ASSUME_NONNULL_END
