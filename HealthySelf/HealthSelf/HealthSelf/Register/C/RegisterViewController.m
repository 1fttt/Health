//
//  ViewControllerRegister.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/5.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import <AFNetworking/AFNetworking.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface RegisterViewController ()
@property (nonatomic, strong)RegisterView *viewRegister;
@property (nonatomic, strong)NSDictionary *userTelDictionary; // 给后台传的验证码
@property (nonatomic, strong)NSDictionary *userVerificationCodeDict; //请求下来的验证码用字典存储
/**
 userVerificationCodeDict = {@"code“:code}
 */
@property (nonatomic, strong)NSDictionary *userMessageDictionary; //验证码成功之后传入用户的账号密码
@property (nonatomic, assign)NSInteger isAllowRegister; // 能否成功登陆
@end
NSTimer *myTimer;
NSInteger myTIme;
@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.viewRegister = [[RegisterView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.viewRegister];
    self.viewRegister.delegate = self;
    [self.viewRegister viewInit];
    myTIme = 10;
    
}
#pragma mark BUttonTarget
- (void)returnButton:(UIButton *)button {
    if (button.tag == 0) {
        [self getVerificationCode];
    } else {
        [self AllowRegister];
        if (self.isAllowRegister == 0) {
            [self failRegister];
        } else {
            [self succeedRegisterPOST];
        }
    }
}


#pragma mark POSTTEl
- (void)getVerificationCode {
    NSString *telString = self.viewRegister.textFieldTelNumber.text;
    if (telString.length != 11) {
        UIAlertController *_alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入有效的手机号!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [_alert addAction:sure];
        [self presentViewController:_alert animated:YES completion:nil];
        self.viewRegister.textFieldTelNumber.text = nil;
    } else {
        [self POSTJSONToServe];
    }
}
// 发送服务器获取验证码
- (void)POSTJSONToServe {
    self.userTelDictionary = @{@"telNumber":self.viewRegister.textFieldTelNumber.text};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:@"" parameters:self.userTelDictionary headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        self.userVerificationCodeDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        //timer
        myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeDel) userInfo:nil repeats:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error");
        myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeDel) userInfo:nil repeats:YES];
    }];
}


#pragma mark AllowRegister
- (void)AllowRegister {
    self.isAllowRegister = 0;
    NSString *strCode = self.viewRegister.textFieldVerificationCode.text;
    NSString *strPassWord = self.viewRegister.textFieldPassWord.text;
    NSString *strPassSureWord = self.viewRegister.textFieldSurePassWord.text;
    if ([strCode isEqualToString:self.userVerificationCodeDict[@"code"]] && ([strPassWord isEqualToString:strPassSureWord] == 1)) {
        self.isAllowRegister = 1;
    }
}
- (void)failRegister {
    UIAlertController *_alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请核对验证码或密码" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [_alert addAction:sure];
    [self presentViewController:_alert animated:YES completion:nil];
    self.viewRegister.textFieldVerificationCode.text = nil;
    self.viewRegister.textFieldPassWord.text = nil;
    self.viewRegister.textFieldSurePassWord.text = nil;
}
- (void)succeedRegisterPOST {
    NSString *strUsername = self.viewRegister.textFieldTelNumber.text;
    NSString *strPassWord = self.viewRegister.textFieldPassWord.text;
    self.userMessageDictionary = @{@"userName":strUsername, @"passWord":strPassWord};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:@"" parameters:self.userMessageDictionary headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        self.userVerificationCodeDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"注册失败");
    }];
    UIAlertController *_alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册成功!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [_alert addAction:sure];
    [self presentViewController:_alert animated:YES completion:nil];
}
- (void)timeDel {
    if (myTIme > 1) {
        myTIme --;
        self.viewRegister.buttonSendVerificationCode.titleLabel.text = [NSString stringWithFormat:@"%ld秒后获取", (long)myTIme];
        [self.viewRegister.buttonSendVerificationCode setTitle:[NSString stringWithFormat:@"%ld秒后获取", myTIme] forState:UIControlStateNormal];
        self.viewRegister.buttonSendVerificationCode.userInteractionEnabled = NO;
    } else {
        myTIme = 60;
        [myTimer invalidate];
        myTimer = nil;
        self.viewRegister.buttonSendVerificationCode.userInteractionEnabled = YES;
        [self.viewRegister.buttonSendVerificationCode setTitle:@"发送验证码" forState:UIControlStateNormal];
    }
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
