//
//  ViewControllerPersonalInformation.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import "ViewControllerPersonalInformation.h"
#import "ViewPersonalInformation.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface ViewControllerPersonalInformation ()
@property (nonatomic, strong)ViewPersonalInformation *viewPersonalInformation;
@end

@implementation ViewControllerPersonalInformation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewPersonalInformation = [[ViewPersonalInformation alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.viewPersonalInformation];
    [self.viewPersonalInformation viewInit];
    self.title = @"Information";
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
