//
//  webNewsView.h
//  HealthSelf
//
//  Created by 李育腾 on 2023/2/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol buttonDelegate <NSObject>

- (void)returnButton:(UIButton *)button;

@end
@interface webNewsView : UIView
- (void)viewInit;
- (void)initWebView :(NSInteger) nowPage;
@property (nonatomic, weak) id<buttonDelegate>exitDelegate;
@property (nonatomic, strong) NSDictionary *topNewsDictionary;
@end

NS_ASSUME_NONNULL_END
