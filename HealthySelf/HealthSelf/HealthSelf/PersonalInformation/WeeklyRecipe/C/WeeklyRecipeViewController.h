//
//  WeeklyRecipeViewController.h
//  HealthSelf
//
//  Created by 张佳慧 on 2023/2/3.
//

#import <UIKit/UIKit.h>
#import "WeeklyRecipeView.h"
#import "WeeklyRecipeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WeeklyRecipeViewController : UIViewController
@property (nonatomic, strong)WeeklyRecipeView* recipeView;
@property (nonatomic, strong)WeeklyRecipeModel* recipeModel;
@end

NS_ASSUME_NONNULL_END
