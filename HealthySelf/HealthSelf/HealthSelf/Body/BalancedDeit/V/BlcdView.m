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
@property (nonatomic, strong) UIButton *returnButton;
@property (nonatomic, strong) UILabel *blcdTlLabel;
@end
@implementation BlcdView
- (void)BlcdViewInit {
    self.backgroundColor = [UIColor whiteColor];
    [self lazyTopView];
    [self lazyArray];
    [self lazyTlLabel];
    [self lazyRtBtn];
    [self lazyBlcdScview];
    [self lazyBlcdImgV];
}
- (UIView *)lazyTopView {
    UIColor *newBlue = [UIColor colorWithRed:219 / 255.0f green:240 / 255.0f blue:232 / 255.0f alpha:1.0];
    if (!_topBackView) {
        _topBackView = [[UIView alloc] init];
        _topBackView.backgroundColor = newBlue;
        _topBackView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT / 9 + 10);
        [self addSubview:_topBackView];
    }
    return _topBackView;
}

- (UILabel *)lazyTlLabel {
    _blcdTlLabel = [[UILabel alloc] init];
    _blcdTlLabel.text = @"均衡饮食";
    _blcdTlLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:19];
    [self.topBackView addSubview:_blcdTlLabel];
    [_blcdTlLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@56);
        make.left.equalTo(@(SCREEN_WIDTH / 2 - 35));
    }];
    return _blcdTlLabel;
}
- (UIButton *)lazyRtBtn {
    if (!_returnButton) {
        _returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_returnButton setImage:[UIImage imageNamed:@"31fanhui1.png"] forState:UIControlStateNormal];
        [_returnButton addTarget:self action:@selector(RtnBodyView) forControlEvents:UIControlEventTouchUpInside];
        [self.topBackView addSubview:_returnButton];
        [_returnButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([self.blcdTlLabel mas_top]).offset(5);
            make.left.equalTo(@14);
            make.width.equalTo(@30);
            make.height.equalTo(@30);
        }];
    }
    return _returnButton;
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

#pragma mark -随时更换背景色
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat x = scrollView.contentOffset.x;
    NSString *xs = [NSString stringWithFormat:@"%.0lf",  x / SCREEN_WIDTH];
    int xss = [xs intValue];
    UIImage *img = [UIImage imageNamed:self.imgAry[xss]];
    self.topBackView.backgroundColor = [self mainColorOfImage:img];
}
//根据图片获取图片的主色调
- (UIColor *)mainColorOfImage:(UIImage *)image{
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo =kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
   //第一步：先把图片缩小，加快计算速度，但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake(50,50);
    CGColorSpaceRef colorSpace =CGColorSpaceCreateDeviceRGB();
    CGContextRef context =CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
   CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
   CGContextDrawImage(context, drawRect, image.CGImage);
   CGColorSpaceRelease(colorSpace);
   //第二步：取每个点的像素值
   unsigned char* data =CGBitmapContextGetData (context);
   if (data == NULL)return nil;
   NSCountedSet *cls= [NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
   for (int x=0; x<thumbSize.width; x++) {
       for (int y=0; y<thumbSize.height; y++) {
           int offset = 4*(x*y);
           int red = data[offset];
           int green = data[offset+1];
           int blue = data[offset+2];
           int alpha =  data[offset+3];

           NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
            [cls addObject:clr];
        }
    }
    CGContextRelease(context);
   //第三步：找到出现次数最多的那个颜色
   NSEnumerator *enumerator = [cls objectEnumerator];
   NSArray *curColor = nil;
   NSArray *MaxColor=nil;
   NSUInteger MaxCount=0;
   while ( (curColor = [enumerator nextObject]) != nil ){
       NSUInteger tmpCount = [cls countForObject:curColor];
       if (tmpCount < MaxCount) continue;
        MaxCount=tmpCount;
        MaxColor=curColor;
    }
   return [UIColor colorWithRed:([MaxColor[0]intValue]/255.0f)green:([MaxColor[1]intValue]/255.0f)blue:([MaxColor[2]intValue]/255.0f)alpha:([MaxColor[3]intValue]/255.0f)];
}

#pragma mark -BtnMeth
- (void)RtnBodyView {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"blcdExit" object:nil userInfo:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
