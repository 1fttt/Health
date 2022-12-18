//
//  ViewControllerRegister.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/5.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface RegisterViewController ()
@property (nonatomic, strong)RegisterView *viewRegister;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.viewRegister = [[RegisterView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.viewRegister];
    self.viewRegister.delegate = self;
    [self.viewRegister viewInit];
    
    
}
#pragma mark BUttonTarget
- (void)returnButton:(UIButton *)button {
    if (button.tag == 0) {
        NSLog(@"发送验证码");
    } else {
        NSLog(@"一键注册");
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
