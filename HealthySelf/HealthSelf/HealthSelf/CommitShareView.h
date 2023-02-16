//
//  ViewCommunityShare.h
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol buttonDelegate <NSObject>

- (void)returnButton:(UIButton *) button;

@end
@protocol imageDelegate <NSObject>

- (void)returnNewsPage:(NSInteger) newsPage;

@end
@interface CommitShareView : UIView
- (void)viewInit;
@property (nonatomic, strong) NSDictionary *topNewsDictionary;
@property (nonatomic, weak) id<buttonDelegate>delegate;
@property (nonatomic, weak) id<imageDelegate>newsDelegate;

@end

NS_ASSUME_NONNULL_END
