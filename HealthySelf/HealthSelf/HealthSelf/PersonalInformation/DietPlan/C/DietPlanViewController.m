//
//  DietPlanViewController.m
//  HealthSelf
//
//  Created by 张佳慧 on 2023/2/3.
//

#import "DietPlanViewController.h"

@interface DietPlanViewController ()

@end

@implementation DietPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dietView = [[DietPlanView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.dietModel = [[DietPlanModel alloc] init];
    [self.view addSubview:self.dietView];
    [self.dietView.backButton addTarget:self action:@selector(pressBackButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pressBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}



@end
