//
//  SetViewController.m
//  HealthSelf
//
//  Created by 张佳慧 on 2022/12/18.
//

#import "SetViewController.h"

@interface SetViewController ()

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.setView = [[SetView alloc] initWithFrame:self.view.bounds];
    self.setView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.setView];
    self.setModel = [[SetModel alloc] init];
    
    [self.setView.backButton addTarget:self action:@selector(pressBackButton) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)pressBackButton {
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
