//
//  ViewControllerLogin.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/5.
//
#import <AFNetworking.h>
/**
 登陆注册
 */
#import "LoginViewController.h"
#import "LoginView.h"
#import "RegisterViewController.h"
/**
 主界面
 */
#import "BodyViewConctroller.h"
#import "DietViewController.h"
#import "CommitShareViewConreoller.h"
#import "PersonalInformationViewController.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface LoginViewController ()<delegateButton>
@property (nonatomic, strong) NSDictionary *dictionaryUser;
@property (nonatomic, strong) NSDictionary *dictionaryPostUser;
@property (nonatomic, assign) NSInteger isLogin;

@property (nonatomic, strong) LoginView *viewLogin;
@property (nonatomic, strong) RegisterViewController *ViewConRegistr;

// 主界面
@property (nonatomic, strong) BodyViewConctroller *viewControllerBody;
@property (nonatomic, strong) DietViewController *viewControllerDiet;
@property (nonatomic, strong) CommitShareViewConreoller *viewControllerCommityShare;
@property (nonatomic, strong) PersonalInformationViewController *viewControllerPersonalInformation;
@property (nonatomic, strong) NSArray *arrayTabbar;
@property (nonatomic, strong) UITabBarController *tabBarController;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.viewLogin = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.viewLogin.delegateButton = self;
    [self.view addSubview:self.viewLogin];
    [self.viewLogin viewInit];
    
    /*
     注册观察者，接收通知
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveUserMessage:) name:@"userMessage" object:nil];
}
// 给其他界面传token
- (void)sentToken {
    NSLog(@"send");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sendToken" object:nil userInfo:self.dictionaryPostUser];
}
#pragma mark DelegateButton
- (void)returnButton:(UIButton *)button {
    if (button.tag == 0) {
        /*
         Login函数和后台交互判断是否能登陆
         */
        [self Login];
    } else {
        self.ViewConRegistr = [[RegisterViewController alloc] init];
        [self.navigationController pushViewController:self.ViewConRegistr animated:YES];
    }
}
#pragma mark NSNotifivation通知传值函数
- (void)receiveUserMessage: (NSNotification *)sender {
    self.dictionaryUser = sender.userInfo;

}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)Login {
    [self postJsonToServe];
}
- (void)login2 {
    if ([self.dictionaryPostUser[@"total"] intValue] == 1) {
        self.isLogin = 1;
    } else if ([self.dictionaryPostUser[@"total"] intValue] == 0) {
        self.isLogin = 0;
    } else {
        self.isLogin = 2;
    }
    if (self.isLogin == 1) {
        [self ToMainView];
        
    } else if (self.isLogin == 0) {
        UIAlertController *_alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户不存在!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [_alert addAction:sure];
        [self presentViewController:_alert animated:YES completion:nil];
        //            NSLog(@"用户不存在");
    } else {
        UIAlertController *_alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码错误!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [_alert addAction:sure];
        [self presentViewController:_alert animated:YES completion:nil];
        //            NSLog(@"密码错误");
    }
    NSLog(@"%ld", self.isLogin);
}
   
#pragma mark POST
/*
     后台要的是json数据
     字典转json
     NSData *jsonUser = [NSJSONSerialization dataWithJSONObject:self.dictionaryUser options:NSJSONWritingPrettyPrinted error:nil];
     NSString *jsonString = [[NSString alloc] initWithData:jsonUser encoding:NSUTF8StringEncoding];
     AFN库直接转json即可
 */
- (void)postJsonToServe {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:@"http://43.143.248.30:8082/user/login" parameters:self.dictionaryUser headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        self.dictionaryPostUser = responseObject;
        [self login2];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error_LoginMessage Failed");
    }];
}
#pragma mark 跳转主界面函数
- (void)ToMainView {
    UIColor *backWhiteColor = [UIColor colorWithRed:253 / 255.0f green:253 / 255.0f blue:253 / 255.0f alpha:1.0];
    self.viewControllerDiet = [[DietViewController alloc] init];
//    self.viewControllerDiet.view.backgroundColor = [UIColor whiteColor];
    
    self.viewControllerBody = [[BodyViewConctroller alloc] init];
//    self.viewControllerBody.view.backgroundColor = [UIColor whiteColor];
    
    self.viewControllerCommityShare = [[CommitShareViewConreoller alloc] init];
//    self.viewControllerCommityShare.view.backgroundColor = [UIColor blackColor];
//    self.viewControllerCommityShare.navigationController.navigationBarHidden = YES;
    
    self.viewControllerPersonalInformation = [[PersonalInformationViewController alloc] init];
//    self.viewControllerPersonalInformation.view.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *navConBody = [[UINavigationController alloc] initWithRootViewController:self.viewControllerBody];
    UINavigationController *navConDiet = [[UINavigationController alloc] initWithRootViewController:self.viewControllerDiet];
    UINavigationController *navConCommityShare = [[UINavigationController alloc] initWithRootViewController:self.viewControllerCommityShare];
    UINavigationController *navConPersonalInformation = [[UINavigationController alloc] initWithRootViewController:self.viewControllerPersonalInformation];
    
    self.arrayTabbar = [NSArray arrayWithObjects:navConDiet, navConBody, navConCommityShare, navConPersonalInformation, nil];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = self.arrayTabbar;
    self.tabBarController.tabBar.backgroundColor = backWhiteColor;
    UIWindow *keyWindow = self.view.window.windowScene.keyWindow;
    keyWindow.rootViewController = self.tabBarController;
    
    UIColor *backGreen = [UIColor colorWithRed:123 / 255.0f green:209 / 255.0f blue:147 / 255.0f alpha:1.0];
    UITabBarItem *tabBarDiet = [[UITabBarItem alloc] init];
    tabBarDiet.image = [[UIImage imageNamed:@"jilu-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarDiet.selectedImage = [[UIImage imageNamed:@"jilu.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarDiet.title = @"身体记录";
    // 一句话设置选中状态下的颜色
    self.viewControllerBody.tabBarController.tabBar.tintColor = backGreen;
    self.viewControllerBody.tabBarItem = tabBarDiet;
    
    
    UITabBarItem *tabBarPersonal = [[UITabBarItem alloc] init];
    tabBarPersonal.image = [[UIImage imageNamed:@"wode-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarPersonal.selectedImage = [[UIImage imageNamed:@"wode.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarPersonal.title = @"我的";
    // 一句话设置选中状态下的颜色
    self.viewControllerPersonalInformation.tabBarController.tabBar.tintColor = backGreen;
    self.viewControllerPersonalInformation.tabBarItem = tabBarPersonal;
    
    UITabBarItem *tabBarCommt = [[UITabBarItem alloc] init];
    tabBarCommt.image = [[UIImage imageNamed:@"spare.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarCommt.selectedImage = [[UIImage imageNamed:@"spare1.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarCommt.title = @"生活广场";
    // 一句话设置选中状态下的颜色
    self.viewControllerCommityShare.tabBarController.tabBar.tintColor = backGreen;
    self.viewControllerCommityShare.tabBarItem = tabBarCommt;
    
    
    self.viewControllerCommityShare.token = self.dictionaryPostUser[@"data"];
    NSLog(@"%@",  self.dictionaryPostUser[@"data"]);
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
