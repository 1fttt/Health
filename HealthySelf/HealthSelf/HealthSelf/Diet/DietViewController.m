//
//  ViewControllerDiet.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import "DietViewController.h"
#import "DietView.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface DietViewController ()
@property (nonatomic, strong)DietView *viewDiet;
@end

@implementation DietViewController

- (void)viewDidLoad {
    [self initTabBarItem];
    [super viewDidLoad];
    [self createNavigationTitle];
    // Do any additional setup after loading the view.
    self.viewDiet = [[DietView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.viewDiet];
    [self.viewDiet viewInit];
    
    
}
- (void)initTabBarItem {
    UIColor *backGreen = [UIColor colorWithRed:123 / 255.0f green:209 / 255.0f blue:147 / 255.0f alpha:1.0];
    UITabBarItem *tabBarDiet = [[UITabBarItem alloc] init];
    tabBarDiet.image = [[UIImage imageNamed:@"diet.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarDiet.selectedImage = [[UIImage imageNamed:@"diet6.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarDiet.title = @"diet";
    // 一句话设置选中状态下的颜色
    self.tabBarController.tabBar.tintColor = backGreen;
    self.tabBarItem = tabBarDiet;
}

- (void) createNavigationTitle {
    UILabel* titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth / 2 - 70, 40)];
    titleLable.font = [UIFont systemFontOfSize:18];
    titleLable.textColor = [UIColor blackColor];
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.text = @"饮食";
    self.navigationItem.titleView = titleLable;
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
