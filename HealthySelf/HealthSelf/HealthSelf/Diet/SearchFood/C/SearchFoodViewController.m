//
//  SearchFoodViewController.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/21.
//

#import "SearchFoodViewController.h"
#import "SearchFoodView.h"
#import <AFNetworking.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface SearchFoodViewController ()<returnButtonDelegate>
@property (nonatomic, strong)SearchFoodView *searchView;
// 关键字搜索食物的URL和字典
@property (nonatomic, strong)NSString *urlKeyNameString;
@property (nonatomic, strong)NSDictionary *keyNameDictionary;
@property (nonatomic, strong)NSMutableArray *keyFoodNameArray;
@property (nonatomic, strong)NSMutableArray *keyFoodIdArray;

- (void)returnButton:(UIButton *)button;
@end

@implementation SearchFoodViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.keyFoodIdArray = [[NSMutableArray alloc] init];
    self.keyFoodNameArray = [[NSMutableArray alloc] init];
    self.searchView = [[SearchFoodView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.searchView];
    self.searchView.ExitDelegate = self;
    [self.searchView viewInit];
    /*
     注册观察者，接收通知
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyNameFood:) name:@"keyNameFood" object:nil];
}
- (void)returnButton:(UIButton *)button {
    if (button.tag == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

// 根据关键词搜索食物
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
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)sendFoodData {
    if ([self.keyNameDictionary[@"data"][@"list"] count] != 0) {
        for (int i = 0; i < [self.keyNameDictionary[@"data"][@"list"] count]; i++) {
            // 用addObject 数组别用copy修饰
            [self.keyFoodIdArray addObject:self.keyNameDictionary[@"data"][@"list"][i][@"foodId"]];
            [self.keyFoodNameArray addObject:self.keyNameDictionary[@"data"][@"list"][i][@"name"]];
        }
        self.searchView.keyFoodIdArray = self.keyFoodIdArray;
        self.searchView.keyFoodNameArray = self.keyFoodNameArray;
//        [self.searchView.keyNameTableView reloadData];
    } else {
        NSLog(@"data NULL");
    }
    NSLog(@"%@", self.keyFoodNameArray);
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
