//
//  webNewsView.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/2/4.
//

#import "webNewsView.h"
#import <WebKit/WebKit.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
#import "Masonry.h"
@interface webNewsView() <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, assign) NSInteger nowPage;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *exitButton;
@end

@implementation webNewsView
- (void)viewInit {
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.bounces = YES;
    self.scrollView.alwaysBounceHorizontal = NO;
    self.scrollView.alwaysBounceVertical = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    
    self.exitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.exitButton setImage:[UIImage imageNamed:@"cha.png"] forState:UIControlStateNormal];
    [self.exitButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    self.exitButton.tag = 0;
    self.exitButton.tintColor = [UIColor blackColor];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"健康评述";
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    
    [self addSubview:_scrollView];
    [self addSubview:self.exitButton];
    [self addSubview:self.titleLabel];
    // scrollView初始位置
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(30);
        make.left.equalTo(self).offset(0);
        make.height.equalTo(@(ScreenHeight * 0.92));
        make.width.equalTo(@(ScreenWidth));
    }];
    [self.exitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@40);
        make.left.equalTo(@10);
        make.width.equalTo(@33);
        make.height.equalTo(@33);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@48);
        make.left.equalTo(@(ScreenWidth / 2 - 38));
    }];
}
- (void)initWebView :(NSInteger) nowPage{
    _scrollView.contentOffset = CGPointMake(ScreenWidth * nowPage, 0);
    _scrollView.tag = 66;
    self.scrollView.contentSize = CGSizeMake(ScreenHeight * 5, 0);
    for (int i = 0; i < 5; i++) {
        _webView = [[WKWebView alloc] init];
        NSURL* urlWeb = [NSURL URLWithString:self.topNewsDictionary[@"result"][@"newslist"][i][@"url"]];
        NSURLRequest* webRequest = [[NSURLRequest alloc] initWithURL:urlWeb];
        [_webView loadRequest:webRequest];
        _webView.frame = CGRectMake(ScreenWidth * i, 30, ScreenWidth, ScreenHeight * 0.9);
        [self.scrollView addSubview:_webView];
    }
}
- (void)pressButton:(UIButton *)button {
    [self.exitDelegate returnButton:button];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
