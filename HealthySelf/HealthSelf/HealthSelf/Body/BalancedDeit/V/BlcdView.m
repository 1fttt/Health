//
//  BlcdView.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/3/9.
//

#import "BlcdView.h"
#import <Masonry/Masonry.h>
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
@interface BlcdView()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *blcdScrollView;
@property (nonatomic, strong) UIImageView *blcdimageV;
@property (nonatomic, strong) NSArray *imgAry;
//
@property (nonatomic, strong) UIView *topBackView;
@end
@implementation BlcdView
- (void)BlcdViewInit {
    self.backgroundColor = [UIColor whiteColor];
    [self lazyTopView];
    [self lazyArray];
    [self lazyBlcdScview];
    [self lazyBlcdImgV];
}
- (UIView *)lazyTopView {
    UIColor *newBlue = [UIColor colorWithRed:94 / 255.0f green:186 / 255.0f blue:209 / 255.0f alpha:1.0];
    if (!_topBackView) {
        _topBackView = [[UIView alloc] init];
        _topBackView.backgroundColor = newBlue;
        _topBackView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT / 9 + 10);
        [self addSubview:_topBackView];
    }
    return _topBackView;
}
- (NSArray *)lazyArray {
    if (!_imgAry) {
        _imgAry = @[@"WechatIMG461.jpeg", @"WechatIMG462.jpeg", @"WechatIMG463.jpeg", @"WechatIMG464.jpeg", @"WechatIMG465.jpeg", @"WechatIMG466.jpeg", @"WechatIMG467.jpeg", @"WechatIMG468.jpeg"];
    }
    return _imgAry;
}
- (UIScrollView *)lazyBlcdScview {
    if (!_blcdScrollView) {
        _blcdScrollView = [[UIScrollView alloc] init];
        _blcdScrollView.frame = CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HEIGHT);
        _blcdScrollView.pagingEnabled = YES;
        _blcdScrollView.scrollEnabled = YES;
        _blcdScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 8, 100);
        _blcdScrollView.bounces = YES;
        _blcdScrollView.alwaysBounceHorizontal = NO;
        _blcdScrollView.alwaysBounceVertical = NO;
        _blcdScrollView.showsHorizontalScrollIndicator = NO;
        _blcdScrollView.delegate = self;
        _blcdScrollView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_blcdScrollView];
    }
    return _blcdScrollView;
}
- (UIImageView *)lazyBlcdImgV {
    if (!_blcdimageV) {
        for (int i = 0; i < 8; i++) {
            _blcdimageV = [[UIImageView alloc] init];
            [_blcdimageV setImage:[UIImage imageNamed:_imgAry[i]]];
            [_blcdScrollView addSubview:_blcdimageV];
            [_blcdimageV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@(i * SCREEN_WIDTH));
                make.top.equalTo(@0);
                make.width.equalTo(@(SCREEN_WIDTH));
                make.height.equalTo(@(SCREEN_HEIGHT - 100));
            }];
        }
    }
    return _blcdimageV;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
