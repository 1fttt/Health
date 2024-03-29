//
//  ViewControllerCommityShare.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import "CommitShareViewConreoller.h"
#import "CommitShareView.h"
#import "EditViewController.h"
#import "webNewsViewController.h"
#import <AFNetworking/AFNetworking.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface CommitShareViewConreoller ()<buttonDelegate, imageDelegate>
@property (nonatomic, strong) CommitShareView *viewCommityShare;
@property (nonatomic, strong) NSDictionary *topNewsDictionary;
- (void)returnButton:(UIButton *)button;
- (void)returnNewsPage:(NSInteger)newsPage;
@end

@implementation CommitShareViewConreoller
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewCommityShare = [[CommitShareView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.viewCommityShare];
    self.viewCommityShare.delegate = self;
    self.viewCommityShare.newsDelegate = self;
    [self requestNews];
   
   
}
- (void)requestNews {
    // 创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 发送GET请求
    NSString *urlString = [NSString stringWithFormat:@"https://apis.tianapi.com/health/index?key=db18b0f596f91f4c3d454651b490dd84&num=5"];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [manager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.topNewsDictionary = responseObject;
        self.viewCommityShare.topNewsDictionary = responseObject;
        [self.viewCommityShare viewInit];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"健康news拉取失败");
    }];
}
#pragma mark ToWebNewsView
- (void)returnNewsPage:(NSInteger)newsPage {
    webNewsViewController *webVC = [[webNewsViewController alloc] init];
    webVC.topNewsDictionary = self.topNewsDictionary;
    webVC.nowPage = newsPage;
    [self.navigationController pushViewController:webVC animated:YES];
}
#pragma mark ToEditView
- (void)returnButton:(UIButton *)button {
    if (button.tag == 1) {
        [self toEditView];
    }
}
- (void)toEditView {
    
    EditViewController *editVC = [[EditViewController alloc] init];
    editVC.token = self.token;
    [self presentViewController:editVC animated:YES completion:nil];
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
