//
//  ViewControllerLogin.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/5.
//

#import "ViewControllerLogin.h"
#import "ViewLogin.h"
#import "ViewControllerRegister.h"
#import <AFNetworking.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface ViewControllerLogin ()<delegateButton>
@property (nonatomic, copy) NSDictionary *dictionaryUser;
@property (nonatomic, copy) NSDictionary *dictionaryPostUser;
@property (nonatomic, strong) ViewLogin *viewLogin;
@property (nonatomic, strong) ViewControllerRegister *ViewConRegistr;
@property (nonatomic, assign) NSInteger isLogin;
@end

@implementation ViewControllerLogin

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.viewLogin = [[ViewLogin alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.viewLogin.delegateButton = self;
    [self.view addSubview:self.viewLogin];
    [self.viewLogin viewInit];
    
    /*
     注册观察者，接收通知
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveUserMessage:) name:@"userMessage" object:nil];
    
}
#pragma mark DelegateButton
- (void)returnButton:(UIButton *)button {
    if (button.tag == 0) {
        /*
         Login函数和后台交互判断是否能登陆
         */
        [self Login];
        if (self.isLogin == 1) {
            NSLog(@"登陆成功");
        } else if (self.isLogin == 0){
            NSLog(@"用户不存在");
        } else {
            NSLog(@"密码错误");
        }
    }  else {
        self.ViewConRegistr = [[ViewControllerRegister alloc] init];
        [self.navigationController pushViewController:self.ViewConRegistr animated:YES];
    }
}
#pragma mark NSNotifivation通知传值函数
- (void)receiveUserMessage: (NSNotification *)sender {
    self.dictionaryUser = sender.userInfo;
//        NSLog(@"%@", self.dictionaryUser);
    
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)Login {
    [self postJsonToServe];
    if ([self.dictionaryUser[@"userName"] isEqualToString:@"123456"] && [self.dictionaryUser[@"passWord"] isEqualToString:@"123"]) {
        self.isLogin = 1;
    } else {
        if ([self.dictionaryUser[@"userName"] isEqualToString:@"123456"]) {
            self.isLogin = 2;
        } else {
            self.isLogin = 0;
        }
    }
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
    [manager POST:@"" parameters:self.dictionaryUser headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        self.dictionaryPostUser = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error");
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
