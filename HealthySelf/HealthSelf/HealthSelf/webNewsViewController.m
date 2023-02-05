//
//  webNewsViewController.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/2/4.
//

#import "webNewsViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "webNewsView.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface webNewsViewController ()<buttonDelegate>
@property (nonatomic, strong) webNewsView *webView;
- (void)returnButton:(UIButton *)button;
@end

@implementation webNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.webView = [[webNewsView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.webView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.webView.topNewsDictionary = self.topNewsDictionary;
    [self.webView viewInit];
    [self.webView initWebView:self.nowPage];
    self.webView.exitDelegate = self;
}
- (void)returnButton:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
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
