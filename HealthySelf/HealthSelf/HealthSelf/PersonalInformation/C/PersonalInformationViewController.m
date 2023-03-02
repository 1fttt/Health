//
//  PersonalInformationViewController.m
//  HealthSelf
//
//  Created by 张佳慧 on 2022/12/17.
//

#import "PersonalInformationViewController.h"
#import "SetViewController.h"
@interface PersonalInformationViewController ()

@end

@implementation PersonalInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.personalInformationView = [[PersonalInformationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];;
    self.personalInformationModel =[[PersonalInformationModel alloc] init];
    [self.view addSubview:self.personalInformationView];
    [self.personalInformationView.setButton addTarget:self action:@selector(pressSetButton) forControlEvents:UIControlEventTouchUpInside];
}
- (void)pressSetButton {
    SetViewController* viewController = [[SetViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}
@end
