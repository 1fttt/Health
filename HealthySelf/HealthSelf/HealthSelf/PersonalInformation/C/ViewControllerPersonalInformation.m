//
//  ViewControllerPersonalInformation.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import "ViewControllerPersonalInformation.h"
#import "ViewPersonalInformation.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface ViewControllerPersonalInformation ()
@property (nonatomic, strong)ViewPersonalInformation *viewPersonalInformation;
@end

@implementation ViewControllerPersonalInformation

- (void)viewDidLoad {
    [self initTabBarItem];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewPersonalInformation = [[ViewPersonalInformation alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.viewPersonalInformation];
    [self.viewPersonalInformation viewInit];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
