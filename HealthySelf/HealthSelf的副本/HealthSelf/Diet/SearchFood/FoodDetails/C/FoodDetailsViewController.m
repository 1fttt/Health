//
//  FoodDetailsViewController.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/29.
//

#import "FoodDetailsViewController.h"
#import "FoodDetailsView.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface FoodDetailsViewController ()
@property (nonatomic, strong)FoodDetailsView *foodDetailsView;
@end

@implementation FoodDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavButtonAndTitle];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.foodDetailsView = [[FoodDetailsView alloc] initWithFrame:CGRectMake(0, 104, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.foodDetailsView];
    self.foodDetailsView.foodDetailsDiciionary = self.foodDetailsDiciionary;
    [self.foodDetailsView initView];
    
   
}
- (void)pressLeft {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)initNavButtonAndTitle {
    UIBarButtonItem *leftBtn2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui-3.png"] style:UIBarButtonItemStyleDone target:self action: @selector(pressLeft)];
    self.navigationItem.leftBarButtonItem = leftBtn2;
    leftBtn2.tintColor = [UIColor blackColor];
    
    UIBarButtonItem *rightBtn2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fenxiang.png"] style:UIBarButtonItemStyleDone target:self action: @selector(pressLeft)];
    self.navigationItem.rightBarButtonItem = rightBtn2;
    rightBtn2.tintColor = [UIColor blackColor];
    self.title = @"食物详细";
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
