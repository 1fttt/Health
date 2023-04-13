//
//  PersonalInformationViewController.m
//  HealthSelf
//
//  Created by 张佳慧 on 2022/12/17.
//

#import "PersonalInformationViewController.h"
#import "SetViewController.h"
#import "MessageViewController.h"
#import "HealthPlanViewController.h"
#import "DietPlanViewController.h"
#import "WeeklyRecipeViewController.h"
#import "FirstViewController.h"
@interface PersonalInformationViewController ()

@end

@implementation PersonalInformationViewController

- (void)viewDidLoad {
    [self initTabBarItem];
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.personalInformationView = [[PersonalInformationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];;
    self.personalInformationModel =[[PersonalInformationModel alloc] init];
    [self.view addSubview:self.personalInformationView];
    [self.personalInformationView.setButton addTarget:self action:@selector(pressSetButton) forControlEvents:UIControlEventTouchUpInside];
    [self.personalInformationView.messageButton addTarget:self action:@selector(pressMessageButton) forControlEvents:UIControlEventTouchUpInside];
    
    //接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpPage1) name:@"firstVToC" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpPage2) name:@"secondVToC" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpPage3) name:@"thirdVToC" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpPage4) name:@"forthVToC" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpPage5) name:@"fifthVToC" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpPage6) name:@"sixthVToC" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpPage7) name:@"seventhVToC" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpPage8) name:@"eighthVToC" object:nil];
    
    self.personalInformationView.delegate = self;
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

- (void)pressSetButton {
    SetViewController* viewController = [[SetViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)pressMessageButton {
    MessageViewController* viewController = [[MessageViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)jumpView:(long)tag {
    if(tag == 0) {
        HealthPlanViewController* viewController = [[HealthPlanViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    if (tag == 1) {
        DietPlanViewController* viewController = [[DietPlanViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    if (tag == 2) {
        WeeklyRecipeViewController* viewController = [[WeeklyRecipeViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    if (tag == 3) {
        
    }
    if (tag == 4) {
        
    }
    if (tag == 5) {
        
    }
}
- (void)jumpPage1 {
    FirstViewController* viewController = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)jumpPage2 {
    HealthPlanViewController* viewController = [[HealthPlanViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)jumpPage3 {
    HealthPlanViewController* viewController = [[HealthPlanViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)jumpPage4 {
    HealthPlanViewController* viewController = [[HealthPlanViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)jumpPage5 {
    HealthPlanViewController* viewController = [[HealthPlanViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)jumpPage6 {
    HealthPlanViewController* viewController = [[HealthPlanViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void)jumpPage7 {
    HealthPlanViewController* viewController = [[HealthPlanViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void)jumpPage8 {
    HealthPlanViewController* viewController = [[HealthPlanViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"firstVToC" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"secondVToC" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"thirdVToC" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"forthVToC" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"fifthVToC" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"sixthVToC" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"seventhVToC" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"eighthVToC" object:nil];
}
@end
