//
//  RecordWtViewController.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/3/2.
//

#import "RecordWtViewController.h"
#import "RecordWtView.h"
#import <Masonry/Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface RecordWtViewController ()
@property (nonatomic, strong) RecordWtView *recordView;
@end

@implementation RecordWtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self lazyRcdView];
}
- (RecordWtView *)lazyRcdView {
    if (_recordView) {
        _recordView = [[RecordWtView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    }
    return _recordView;
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
