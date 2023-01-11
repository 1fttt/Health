//
//  SearchFoodViewController.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/21.
//

#import "SearchFoodViewController.h"
#import "SearchFoodView.h"
#import "FoodDetailsViewController.h"
#import <AFNetworking.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface SearchFoodViewController ()<returnButtonDelegate, returnFoodNameDelegate>
@property (nonatomic, strong)SearchFoodView *searchView;
// 关键字搜索食物的URL和字典
@property (nonatomic, strong)NSString *urlKeyNameString;
@property (nonatomic, strong)NSDictionary *keyNameDictionary;
@property (nonatomic, strong)NSMutableArray *keyFoodNameArray;
@property (nonatomic, strong)NSMutableArray *keyFoodIdArray;

// ID查食物详细信息
@property (nonatomic, strong)NSDictionary *foodDetailsDiciionary;
@property (nonatomic, strong)NSString *urlFoodIdString;

// 协议传值的方法
- (void)returnButton:(UIButton *)button;
- (void)returnFoodName:(NSString *)foodIdString;
@end

@implementation SearchFoodViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.searchView = [[SearchFoodView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.searchView];
    self.searchView.ExitDelegate = self;
    self.searchView.foodDetailsDelegate = self;
    [self.searchView viewInit];
    /*
     注册观察者，接收通知
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyNameFood:) name:@"keyNameFood" object:nil];
    UIColor *buttonColor = [UIColor colorWithRed:105 / 255.0f green:183 / 255.0f blue:135 / 255.0f alpha:1.0];
    UIBarButtonItem* leftBtn2 = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeftLogin)];
    leftBtn2.tintColor = buttonColor;
    self.navigationItem.leftBarButtonItem = leftBtn2;
}
- (void)pressLeftLogin {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)returnButton:(UIButton *)button {
    if (button.tag == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark 根据关键词搜索食物

- (void)getFoodNameRequest {
    //创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 发送GET请求
    NSString *urlString = [NSString stringWithFormat:@"https://www.mxnzp.com/api/food_heat/food/search?keyword=%@&page=1&app_id=icwnrnfenlpvforw&app_secret=N1BEY0R5ZkVMM1B0b2t6R3F6YkVzZz09", self.urlKeyNameString];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [manager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.keyNameDictionary = responseObject;
//        NSLog(@"%@", self.keyNameDictionary);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"关键词查找失败");
    }];
}
- (void)keyNameFood: (NSNotification *)sender {
    self.urlKeyNameString = sender.userInfo[@"keyName"];
    if ([self.urlKeyNameString isEqualToString:@""] || self.urlKeyNameString == nil) {
        NSLog(@"NO");
    } else {
        [self getFoodNameRequest];
        [self sendFoodData];
    }
}
- (void)sendFoodData {
    self.keyFoodIdArray = [[NSMutableArray alloc] init];
    self.keyFoodNameArray = [[NSMutableArray alloc] init];
    if ([self.keyNameDictionary[@"data"][@"list"] count] != 0) {
        for (int i = 0; i < [self.keyNameDictionary[@"data"][@"list"] count]; i++) {
            // 用addObject方法的数组别用copy修饰
            [self.keyFoodIdArray addObject:self.keyNameDictionary[@"data"][@"list"][i][@"foodId"]];
            [self.keyFoodNameArray addObject:self.keyNameDictionary[@"data"][@"list"][i][@"name"]];
        }
        self.searchView.keyFoodIdArray = self.keyFoodIdArray;
        self.searchView.keyFoodNameArray = self.keyFoodNameArray;
        [self.searchView.keyNameTableView reloadData];
    } else {
        NSLog(@"data NULL");
    }
    NSLog(@"%@", self.keyFoodNameArray);
}
#pragma mark 根据ID查食物details
- (void)returnFoodName:(NSString *)foodIdString {
    self.urlFoodIdString = foodIdString;
    [self searchFoodDetailsRequest];
    NSLog(@"%@", self.urlFoodIdString);
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
