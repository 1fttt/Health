//
//  MenuDetailsViewController.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/12.
//

#import "MenuDetailsViewController.h"
#import "MenuDetailsView.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface MenuDetailsViewController ()
@property(nonatomic, strong)MenuDetailsView *menuDetailsView;
@property (nonatomic, strong) UIAlertController *timeAlter;
@end

@implementation MenuDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recordMenu) name:@"recordMenu" object:nil];
    // Do any additional setup after loading the view.
    self.menuDetailsView = [[MenuDetailsView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.menuDetailsView];
    [self titleSet];
    self.menuDetailsView.menuStepDictionary = self.menuStepDictionary;
    self.menuDetailsView.menuMaterialDiciionary = self.menuMaterialDiciionary;
    [self.menuDetailsView viewInit];
    
}
- (void)titleSet {
   self.title = @"原料做法";
   UIBarButtonItem* leftBtn2 = [[UIBarButtonItem alloc]initWithTitle:@"< Diet" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
   leftBtn2.tintColor = [UIColor blackColor];
   self.navigationItem.leftBarButtonItem = leftBtn2;
}
- (void)pressLeft {
   [self.navigationController popViewControllerAnimated:YES];
}

- (void)recordMenu {
    NSLog(@"Controller记录菜谱");
    self.timeAlter = [UIAlertController alertControllerWithTitle:@"提示" message:@"小轻已经帮你记下了菜谱，记得去学习实践哦！" preferredStyle:UIAlertControllerStyleAlert];
    NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timeOut) userInfo:nil repeats:NO];
    [self presentViewController:self.timeAlter animated:YES completion:nil];
}
- (void)timeOut {
    [self.timeAlter dismissViewControllerAnimated:YES completion:nil];
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
