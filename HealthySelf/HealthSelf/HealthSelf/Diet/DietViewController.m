//
//  ViewControllerDiet.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import "DietViewController.h"
#import "DietView.h"
#import "SearchFoodViewController.h"
#import <Masonry.h>
#import "FoodCategoryViewController.h"
#import "RecipesViewController.h"
#import "MenuViewController.h"
#import <AFNetworking.h>

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

@interface DietViewController ()<MoreButtonDelegate, MenuButtonDelegate>
@property (nonatomic, strong)DietView *viewDiet;
@property (nonatomic, strong)NSDictionary *foodCateDictionary;
@end

@implementation DietViewController

- (void)viewDidLoad {
    [self initTabBarItem];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewDiet = [[DietView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.viewDiet];
//    [self menuDictionary1Requet];
    [self menuDictionary2Requet];
    [self.viewDiet viewInit];
    self.viewDiet.moreButtonDelegate = self;
    self.viewDiet.menuButtonDelegate = self;
    /*
     注册观察者，接收通知
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ToSearchView) name:@"ToSearchFoodView" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ToFoodCategoryView:) name:@"RecipesToFoodCategoryView" object:nil];
    
}
- (void)initTabBarItem {
    UIColor *backGreen = [UIColor colorWithRed:123 / 255.0f green:209 / 255.0f blue:147 / 255.0f alpha:1.0];
    UITabBarItem *tabBarDiet = [[UITabBarItem alloc] init];
    tabBarDiet.image = [[UIImage imageNamed:@"canyin-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarDiet.selectedImage = [[UIImage imageNamed:@"canyin.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarDiet.title = @"diet";
    // 一句话设置选中状态下的颜色
    self.tabBarController.tabBar.tintColor = backGreen;
    self.tabBarItem = tabBarDiet;
}
#pragma mark NSNotifivation通知传值函数
- (void)ToSearchView {
    SearchFoodViewController *searchViewController = [[SearchFoodViewController alloc] init];
    
    [self.navigationController pushViewController:searchViewController animated:YES];
    
}
- (void)ToFoodCategoryView: (NSNotification *)sender {
    NSString* Id = sender.userInfo[@"foodId"];
    NSInteger IDD = [Id integerValue];
    [self searchCategoryRequest:IDD];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark MoreButtonDelegate
- (void)returnMoreButtonTag:(UIButton *)MoreButton {
    if (MoreButton.tag == 200) {
        // 水果- FoodCategory
        [self searchCategoryRequest:5];
    } else if (MoreButton.tag == 201) {
        // 饮料- FoodCatagory
        [self searchCategoryRequest:10];
    } else if (MoreButton.tag == 202) {
        // 相机
    } else if (MoreButton.tag == 203) {
        // 食谱- Recipes
        [self searchRecipesRequest];
    }
}
- (void)searchCategoryRequest:(NSInteger)categoryString {
    //创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 发送GET请求
    NSString *urlString = [NSString stringWithFormat:@"https://www.mxnzp.com/api/food_heat/food/list?id=%ld&page=1&app_id=icwnrnfenlpvforw&app_secret=N1BEY0R5ZkVMM1B0b2t6R3F6YkVzZz09", categoryString];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [manager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.foodCateDictionary = responseObject;
        FoodCategoryViewController *foodCaregoryVC = [[FoodCategoryViewController alloc] init];
        foodCaregoryVC.setTitleNameId = categoryString;
        foodCaregoryVC.foodCateDictionary = self.foodCateDictionary;
        [self.navigationController pushViewController:foodCaregoryVC animated:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Category关键词查找失败");
    }];
}
- (void)searchRecipesRequest {
    //创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 发送GET请求
    NSString *urlString = @"https://www.mxnzp.com/api/food_heat/type/list?app_id=icwnrnfenlpvforw&app_secret=N1BEY0R5ZkVMM1B0b2t6R3F6YkVzZz09";
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [manager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        RecipesViewController *recipesVc = [[RecipesViewController alloc] init];
        recipesVc.recipesDiciionary = responseObject;
        [self.navigationController pushViewController:recipesVc animated:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"recipes关键词查找失败");
    }];
}
# pragma mark MenuMethod
// 主界面的字典
- (void)menuDictionary1Requet {
    //创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 发送GET请求
    NSString *urlString = @"https://way.jd.com/jisuapi/search?keyword=减肥&num=1&appkey=da39dce4f8aa52155677ed8cd23a6470";
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [manager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.viewDiet.menuDicit1 = responseObject;
        [self.viewDiet creatMenuDetails];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"menu查找失败");
    }];
}
- (void)menuDictionary2Requet {
    //创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 发送GET请求
    NSString *urlString = @"https://way.jd.com/jisuapi/search?keyword=里脊&num=1&appkey=da39dce4f8aa52155677ed8cd23a6470";
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [manager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.viewDiet.menuDicit2 = responseObject;
        [self menuDictionary1Requet];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"menu查找失败");
    }];
}
// menuView的协议函数
- (void)returnMenuButtonTag:(UIButton *)MenuButton {
    if (MenuButton.tag == 666) {
        [self menuCategoryRequest:@"减脂"];
    } else {
        [self menuCategoryRequest:@"营养"];
    }
}
- (void)menuCategoryRequest:(NSString *)menuName {
    //创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 发送GET请求
    NSString *urlString = [NSString stringWithFormat:@"https://way.jd.com/jisuapi/search?keyword=%@&num=10&appkey=da39dce4f8aa52155677ed8cd23a6470", menuName];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [manager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        MenuViewController *menuViewC = [[MenuViewController alloc] init];
        menuViewC.menuListDictionary = responseObject;
        [self.navigationController pushViewController:menuViewC animated:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"menuCategory查找失败");
    }];
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
