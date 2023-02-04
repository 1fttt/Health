//
//  ViewControllerBody.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import "BodyViewConctroller.h"
#import "BodyView.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface BodyViewConctroller ()
@property (nonatomic, strong)BodyView *viewBody;
@end

@implementation BodyViewConctroller

- (void)viewDidLoad {
    [self initTabBarItem];
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.viewBody = [[BodyView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.viewBody];
    [self.viewBody viewInit];

}
- (void)initTabBarItem {
    UIColor *backGreen = [UIColor colorWithRed:123 / 255.0f green:209 / 255.0f blue:147 / 255.0f alpha:1.0];
    UITabBarItem *tabBarDiet = [[UITabBarItem alloc] init];
    tabBarDiet.image = [[UIImage imageNamed:@"jilu-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarDiet.selectedImage = [[UIImage imageNamed:@"jilu.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarDiet.title = @"身体记录";
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
