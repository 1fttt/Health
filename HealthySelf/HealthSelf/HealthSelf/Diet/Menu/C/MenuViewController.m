//
//  MenuViewController.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/11.
//

#import "MenuViewController.h"
#import "MenuDetailsViewController.h"
#import "MenuView.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface MenuViewController ()
@property (nonatomic, strong)MenuView *menuView;
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     注册观察者，接收通知
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ToMenuStepView:) name:@"ToMenuStepView" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(failedMenu) name:@"faliedMenu" object:nil];
    // Do any additional setup after loading the view.
    self.menuView = [[MenuView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.menuView];
    [self titleSet];
    self.menuView.menuListDictionary = self.menuListDictionary;
    [self.menuView viewInit];
    
}
- (void)titleSet {
   self.title = @"菜谱";
   UIBarButtonItem* leftBtn2 = [[UIBarButtonItem alloc]initWithTitle:@"< Diet" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
   leftBtn2.tintColor = [UIColor blackColor];
   self.navigationItem.leftBarButtonItem = leftBtn2;
}
- (void)pressLeft {
   [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 通知传值
- (void)ToMenuStepView :(NSNotification *)sender {
    MenuDetailsViewController *menuDeVC = [[MenuDetailsViewController alloc] init];
    NSInteger cellRowOfIndexPath = [sender.userInfo[@"cellRowOfIndexPath"] integerValue];
    menuDeVC.menuMaterialDiciionary = self.menuListDictionary[@"result"][@"result"][@"list"][cellRowOfIndexPath];
    menuDeVC.menuStepDictionary = self.menuListDictionary[@"result"][@"result"][@"list"][cellRowOfIndexPath];
    [self.navigationController pushViewController:menuDeVC animated:YES];
}
#pragma mark -菜单失败
- (void)failedMenu {
    UIAlertController *_alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"菜单库暂时未更新该菜品！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [_alert addAction:sure];
    [self presentViewController:_alert animated:YES completion:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
