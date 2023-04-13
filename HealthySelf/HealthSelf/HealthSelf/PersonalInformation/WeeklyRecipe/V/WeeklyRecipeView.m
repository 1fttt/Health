//
//  WeeklyRecipeView.m
//  HealthSelf
//
//  Created by 张佳慧 on 2023/2/3.
//

#import "WeeklyRecipeView.h"
#import "Masonry.h"
@implementation WeeklyRecipeView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    
    UIView* headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 100)];
    headView.backgroundColor = [UIColor whiteColor];
    [self addSubview:headView];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    [headView addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.mas_equalTo(50);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    return self;
}

@end
