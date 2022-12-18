//
//  PersonalInformationViewController.m
//  HealthSelf
//
//  Created by 张佳慧 on 2022/12/17.
//

#import "PersonalInformationViewController.h"

@interface PersonalInformationViewController ()

@end

@implementation PersonalInformationViewController

- (void)viewDidLoad {
    [self initTabBarItem];
    [super viewDidLoad];
    self.personalInformationView = [[PersonalInformationView alloc] initWithFrame:self.view.bounds];;
    self.personalInformationModel =[[PersonalInformationModel alloc] init];
    [self.view addSubview:self.personalInformationView];
}

- (void)initTabBarItem {
    UIColor *backGreen = [UIColor colorWithRed:123 / 255.0f green:209 / 255.0f blue:147 / 255.0f alpha:1.0];
    UITabBarItem *tabBarDiet = [[UITabBarItem alloc] init];
    tabBarDiet.image = [[UIImage imageNamed:@"wode-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarDiet.selectedImage = [[UIImage imageNamed:@"wode.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarDiet.title = @"我的";
    // 一句话设置选中状态下的颜色
    self.tabBarController.tabBar.tintColor = backGreen;
    self.tabBarItem = tabBarDiet;
}

@end
