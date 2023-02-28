//
//  FoodCategoryViewController.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/5.
//

#import "FoodCategoryViewController.h"
#import "FoodCategoryView.h"
#import "SearchFoodViewController.h"
#import <AFNetworking.h>
#import <Masonry.h>
#import "FoodDetailsViewController.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface FoodCategoryViewController ()
@property (nonatomic, strong)FoodCategoryView *foodCategoryView;
@property (nonatomic, strong)NSArray *foodCategoryNameArray;
@property (nonatomic, strong)NSString *urlFoodIdString;
@property (nonatomic, strong)NSDictionary *foodDetailsDiciionary;
@end

@implementation FoodCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem* leftBtn2 = [[UIBarButtonItem alloc]initWithTitle:@"< Diet" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    leftBtn2.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = leftBtn2;
    // Do any additional setup after loading the view.
    self.foodCategoryView = [[FoodCategoryView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.foodCategoryView.foodCateDictionary = self.foodCateDictionary;
    [self.view addSubview:self.self.foodCategoryView];
    [self setTileName];
    /*
     注册观察者，接收通知
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ToSearchView) name:@"CategoryToSearchFoodView" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toFoodDetails:) name:@"CategoryToFoodDetailsView" object:nil];
    [self.foodCategoryView viewInit];
}

- (void)setTileName {
    self.foodCategoryNameArray = @[@"主食类", @"肉蛋", @"大豆及制品", @"蔬菜菌藻类", @"水果类", @"奶类", @"油脂类", @"坚果类", @"调味品", @"饮料类", @"零食及冷饮"];
    self.title = [NSString stringWithFormat:@"%@", self.foodCategoryNameArray[self.setTitleNameId - 1]];
}
- (void)pressLeft {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark NSNotifivation通知传值函数
- (void)ToSearchView {
    SearchFoodViewController *searchViewController = [[SearchFoodViewController alloc] init];
    [self.navigationController pushViewController:searchViewController animated:YES];
}
- (void)toFoodDetails:(NSNotification *)sender {
    self.urlFoodIdString = sender.userInfo[@"ID"];
    [self searchFoodDetailsRequest];
}
- (void)searchFoodDetailsRequest {
    //创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 发送GET请求
    NSString *urlString = [NSString stringWithFormat:@"https://www.mxnzp.com/api/food_heat/food/details?foodId=%@&page=1&app_id=icwnrnfenlpvforw&app_secret=N1BEY0R5ZkVMM1B0b2t6R3F6YkVzZz09", self.urlFoodIdString];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [manager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.foodDetailsDiciionary = responseObject;
        FoodDetailsViewController *foodVC = [[FoodDetailsViewController alloc] init];
        foodVC.foodDetailsDiciionary = self.foodDetailsDiciionary;
        [self.navigationController pushViewController:foodVC animated:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Details关键词查找失败");
    }];
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
