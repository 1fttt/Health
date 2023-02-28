//
//  webNewsViewController.h
//  HealthSelf
//
//  Created by 李育腾 on 2023/2/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface webNewsViewController : UIViewController
@property (nonatomic, strong) NSDictionary *topNewsDictionary;
@property (nonatomic, assign) NSInteger nowPage;
@end

NS_ASSUME_NONNULL_END
