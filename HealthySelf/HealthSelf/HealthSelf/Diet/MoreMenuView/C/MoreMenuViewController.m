//
//  MoreMenuViewController.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/13.
//

#import "MoreMenuViewController.h"
#import "MoreMenuView.h"
#import "MenuViewController.h"
#import <AFNetworking.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface MoreMenuViewController ()<returnButtonDelegate>
@property (nonatomic, strong)MoreMenuView *moreMenuView;
// 协议传值的方法
- (void)returnButton:(UIButton *)button;
//
@property (nonatomic, copy)NSArray *majoritySearchFoodArray;
@end

@implementation MoreMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.moreMenuView = [[MoreMenuView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.majoritySearchFoodArray = @[@"减脂", @"减肥", @"月子", @"蛋白", @"鱼", @"健身", @"粥"];
    [self.view addSubview:self.moreMenuView];
    self.moreMenuView.MenuButtonDelegate = self;
    [self.moreMenuView viewInit];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyNameFood:) name:@"keyMenuName" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchError) name:@"searchError" object:nil];
    [self SetTitle];
}
- (void)SetTitle {
    UIBarButtonItem* leftBtn2 = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeftLogin)];
    leftBtn2.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = leftBtn2;
    self.title = @"食谱探索";
}
- (void)pressLeftLogin {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark SearchMenView
// 按钮进入菜谱
- (void)returnButton:(UIButton *)button {
    NSString *menuName = self.majoritySearchFoodArray[(button.tag - 100)];
    [self menuCategoryRequest:menuName];
}

// 搜索框进入菜谱
- (void)keyNameFood:(NSNotification *)sender {
    [self menuCategoryRequest:sender.userInfo[@"menuName"]];
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
- (void)searchError {
    UIAlertController *_alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"傻狗你输错了!" preferredStyle:UIAlertControllerStyleAlert];
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
