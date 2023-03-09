//
//  BlcdViewController.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/3/9.
//

#import "BlcdViewController.h"
#import "BlcdView.h"
#import <Masonry/Masonry.h>
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
@interface BlcdViewController ()
@property (nonatomic, strong) BlcdView *blcdView;
@end

@implementation BlcdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self lazyBlcdView];
    [self.blcdView BlcdViewInit];
}
- (BlcdView *)lazyBlcdView {
    if (!_blcdView) {
        _blcdView = [[BlcdView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [self.view addSubview:_blcdView];
    }
    return _blcdView;
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
