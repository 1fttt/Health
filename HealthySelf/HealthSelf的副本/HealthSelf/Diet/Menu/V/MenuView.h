//
//  MenuView.h
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuView : UIView
@property (nonatomic, strong)NSDictionary *menuListDictionary;
- (void)viewInit;
@end

NS_ASSUME_NONNULL_END
