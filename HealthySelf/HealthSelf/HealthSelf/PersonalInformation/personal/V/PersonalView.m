//
//  PersonalView.m
//  HealthSelf
//
//  Created by 张佳慧 on 2023/1/10.
//

#import "PersonalView.h"
#import "Masonry.h"
@implementation PersonalView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor greenColor];
    
    UIView* headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.bounds.size.width, 100)];
    headView.backgroundColor = [UIColor whiteColor];
    [self addSubview:headView];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    [headView addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(60);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
