//
//  WeeklyRecipeViewController.m
//  HealthSelf
//
//  Created by 张佳慧 on 2023/2/3.
//

#import "WeeklyRecipeViewController.h"

@interface WeeklyRecipeViewController ()

@end

@implementation WeeklyRecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.recipeView = [[WeeklyRecipeView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.recipeModel = [[WeeklyRecipeModel alloc] init];
    [self.view addSubview:self.recipeView];
    [self.recipeView.backButton addTarget:self action:@selector(pressBackButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pressBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}



@end
