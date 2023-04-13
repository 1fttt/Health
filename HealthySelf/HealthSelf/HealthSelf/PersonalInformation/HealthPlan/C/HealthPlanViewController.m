//
//  HealthPlanViewController.m
//  HealthSelf
//
//  Created by 张佳慧 on 2023/2/3.
//

#import "HealthPlanViewController.h"

@interface HealthPlanViewController ()

@end

@implementation HealthPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _healthView = [[HealthPlanView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    _healthModel = [[HealthPlanModel alloc] init];
    [self.view addSubview:_healthView];
    
    [self.healthView.backButton addTarget:self action:@selector(pressBackButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pressBackButton {
[self.navigationController popViewControllerAnimated:YES];
}


@end
