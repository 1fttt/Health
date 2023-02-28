//
//  SetViewController.h
//  HealthSelf
//
//  Created by 张佳慧 on 2022/12/18.
//

#import <UIKit/UIKit.h>
#import "SetView.h"
#import "SetModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface SetViewController : UIViewController
@property (nonatomic, strong)SetView* setView;
@property (nonatomic, strong)SetModel* setModel;
@end

NS_ASSUME_NONNULL_END
