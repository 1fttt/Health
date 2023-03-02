//
//  ViewBody.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import "BodyView.h"
#import <Masonry/Masonry.h>
#import <HealthKit/HealthKit.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface BodyView()
// part-0 btset
@property (nonatomic, strong) UIView *topBackView;
@property (nonatomic, strong) UIButton *makeFrdButton;
@property (nonatomic, strong) UIButton *scanButton;
// part-1 wtNum
@property (nonatomic, strong) UIView *weightBackView;
@property (nonatomic, strong) UILabel *weightTlLabel;
@property (nonatomic, strong) UIButton *isWtHidenButton;
@property (nonatomic, strong) UILabel *unitLabel;
@property (nonatomic, strong) UILabel *progressLabel;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UILabel *sliderLabel;
@property (nonatomic, strong) UILabel *chLabel;
@property (nonatomic, strong) UILabel *wtNumLabel;
@property (nonatomic, strong) UIButton *changeWtButton;

@end
@implementation BodyView

- (void)viewInit {
    UIColor *newBackGroundGray = [UIColor colorWithRed:246 / 255.0f green: 247 / 255.0f blue: 250 / 255.0f alpha:1.0];
    self.backgroundColor = newBackGroundGray;
    
    [self lazyTopView];
    [self lazyMkFrdButton];
    [self lazyScanButton];
    
    [self lazywtBackView];
    [self lazywtTLabel];
    [self lazyWtHidButton];
    [self lazyUnitTLabel];
    [self lazyPrgLabel];
    [self lazySlider];
    [self lazySldLabel];
    [self lazyChLabel];
    [self lazyWtNumLabel];
    [self lazyChagWtBt];
 
}
# pragma mark- LazyMethod
- (UIView *)lazyTopView {
    if (!_topBackView) {
        _topBackView = [[UIView alloc] init];
        _topBackView.backgroundColor = [UIColor whiteColor];
        _topBackView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight / 9);
        [self addSubview:_topBackView];
//        [_topBackView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(0);
//            make.left.equalTo(0);
//            make.width.equalTo(@(ScreenWidth));
//            make.height.equalTo(@(ScreenHeight / 9));
//        }];
    }
    return _topBackView;
}
- (UIButton *)lazyMkFrdButton {
    _makeFrdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_makeFrdButton setImage:[UIImage imageNamed:@"tianjiahaoyou.png"] forState:UIControlStateNormal];
    [_makeFrdButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    _makeFrdButton.tag = 3;
    [self.topBackView addSubview:_makeFrdButton];
    [_makeFrdButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-12);
        make.right.equalTo(@-75);
        make.width.equalTo(@24);
        make.height.equalTo(@24);
    }];
    return _makeFrdButton;
}
- (UIButton *)lazyScanButton {
    _scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_scanButton setImage:[UIImage imageNamed:@"saoyisao.png"] forState:UIControlStateNormal];
    [_scanButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    _scanButton.tag = 4;
    [self.topBackView addSubview:_scanButton];
    [_scanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-12);
        make.right.equalTo(@-20);
        make.width.equalTo(@24);
        make.height.equalTo(@24);
    }];
    return _scanButton;
}

- (UIView *)lazywtBackView {
    if (!_weightBackView) {
        _weightBackView = [[UIView alloc] init];
        _weightBackView.backgroundColor = [UIColor whiteColor];
        _weightBackView.layer.masksToBounds = YES;
        _weightBackView.layer.cornerRadius = 16.0;
        [self addSubview:_weightBackView];
        [_weightBackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([self.topBackView mas_bottom]).offset(15);
            make.left.equalTo(@25);
            make.width.equalTo(@(ScreenWidth - 50));
            make.height.equalTo(@(ScreenHeight / 6));
        }];
    }
    return _weightBackView;
}
- (UILabel *)lazywtTLabel {
    if (!_weightTlLabel) {
        _weightTlLabel = [[UILabel alloc] init];
        _weightTlLabel.text = @"身体计划";
        _weightTlLabel.font = [UIFont fontWithName:@"TimesNewRomanPs-BoldItalicMT" size:14];
        [_weightBackView addSubview:_weightTlLabel];
        [_weightTlLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@15);
            make.left.equalTo(@10);
        }];
    }
    return _weightTlLabel;;
}
- (UIButton *)lazyWtHidButton {
    _isWtHidenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_isWtHidenButton setImage:[UIImage imageNamed:@"yanjing-2.png"] forState:UIControlStateNormal];
    [_isWtHidenButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    _isWtHidenButton.tag = 0;
    [_weightBackView addSubview:_isWtHidenButton];
    [_isWtHidenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo([self.weightTlLabel mas_right]).offset(10);
        make.width.equalTo(@25);
        make.height.equalTo(@25);
    }];
    return _isWtHidenButton;;
}
- (UILabel *)lazyUnitTLabel {
    if (!_unitLabel) {
        _unitLabel = [[UILabel alloc] init];
        _unitLabel.text = @"单位：公斤";
        _unitLabel.font = [UIFont systemFontOfSize:10];
        _unitLabel.textColor = [UIColor grayColor];
        [_weightBackView addSubview:_unitLabel];
        [_unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([_weightTlLabel mas_bottom]).offset(7);
            make.left.equalTo(@10);
        }];
    }
    return _unitLabel;;
}
- (UILabel *)lazyPrgLabel {
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] init];
        _progressLabel.text = @"进行中";
        _progressLabel.font = [UIFont systemFontOfSize:12];
        [_weightBackView addSubview:_progressLabel];
        [_progressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@15);
            make.right.equalTo(@-40);
        }];
    }
    return _progressLabel;;
}
- (UISlider *)lazySlider {
    UIColor *maxColor = [UIColor colorWithRed:124 / 255.0f green:210 / 255.0f blue:154 / 255.0f alpha:1.0];
    UIColor *minColor = [UIColor colorWithRed:206 / 255.0f green:240 / 255.0f blue:223 / 255.0f alpha:1.0];
    _slider = [[UISlider alloc]init];
    //滑动条最大最小值可以设置 且可以为负数
    _slider.maximumValue = 100;
    _slider.minimumValue = 0;
    // 滑动条的滑块位置float类型，相对于最大最小值
    _slider.value = 0.5;
    _slider.minimumTrackTintColor = maxColor;
    _slider.maximumTrackTintColor = minColor;
    //设置滑块的颜色
    _slider.thumbTintColor = [UIColor whiteColor];
    _slider.continuous = YES;
    [_slider addTarget:self action:@selector(goSlider) forControlEvents:UIControlEventValueChanged];
    [self.weightBackView addSubview:_slider];
    [_slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.unitLabel mas_bottom]).offset(15);
        make.left.equalTo(@10);
        make.height.equalTo(@5);
        make.width.equalTo([self.weightBackView mas_width]).offset(-20);
    }];
    return _slider;
}
- (UILabel *)lazySldLabel {
    UIColor *maxColor = [UIColor colorWithRed:124 / 255.0f green:210 / 255.0f blue:154 / 255.0f alpha:1.0];
    if (!_sliderLabel) {
        _sliderLabel = [[UILabel alloc] init];
        _sliderLabel.text = @"未开始";
        _sliderLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:11];

        _sliderLabel.backgroundColor = [UIColor whiteColor];
        _sliderLabel.textColor = maxColor;
        [_weightBackView addSubview:_sliderLabel];
        [_sliderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([_unitLabel mas_bottom]).offset(-5);
            make.left.equalTo(@(ScreenWidth / 2 - 55));
        }];
    }
    return _sliderLabel;;
}
- (UILabel *)lazyChLabel {
    NSArray *chArray = @[@"初始", @"当前", @"目标"];
    if (!_chLabel) {
        for (int i = 0; i < 3; i++) {
            _chLabel = [[UILabel alloc] init];
            _chLabel.text = chArray[i];
            _chLabel.font = [UIFont systemFontOfSize:11];
            _chLabel.textColor = [UIColor grayColor];
            [_weightBackView addSubview:_chLabel];
            [_chLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([self.slider mas_bottom]).offset(45);
                make.left.equalTo(@(20 + ScreenWidth / 3 * i));
            }];
        }
    }
    return _chLabel;
}
- (UILabel *)lazyWtNumLabel {
    NSArray *chArray = @[@"89.67", @"78.30", @"67.00"];
    if (!_wtNumLabel) {
        for (int i = 0; i < 3; i++) {
            _wtNumLabel = [[UILabel alloc] init];
            _wtNumLabel.text = chArray[i];
            _wtNumLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
            [_weightBackView addSubview:_wtNumLabel];
            [_wtNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([self.slider mas_bottom]).offset(22);
                make.left.equalTo(@(14 + ScreenWidth / 3 * i));
            }];
        }
    }
    return _wtNumLabel;
}
- (UIButton *)lazyChagWtBt {
    _changeWtButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_changeWtButton setImage:[UIImage imageNamed:@"xie.png"] forState:UIControlStateNormal];
    [_changeWtButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    _changeWtButton.tag = 2;
    [_weightBackView addSubview:_changeWtButton];
    [_changeWtButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.wtNumLabel mas_top]).offset(2);
        make.left.equalTo(@(ScreenWidth / 2 - 8));
        make.width.equalTo(@16);
        make.height.equalTo(@16);
    }];
    return _changeWtButton;;
    
}
#pragma mark -rsp Method
- (void)pressButton:(UIButton *)button {
    if (button.tag == 0) {
        button.tag = 1;
        [button setImage:[UIImage imageNamed:@"biyanjing-2.png"] forState:UIControlStateNormal];
    } else if (button.tag == 1){
        button.tag = 0;
        [button setImage:[UIImage imageNamed:@"yanjing-2.png"] forState:UIControlStateNormal];
    } else if(button.tag == 2){
        /*注册通知并发送*/
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ToCgWtView" object:nil userInfo:nil];
    } 
    
}
- (void)goSlider {
    _sliderLabel.text = [NSString stringWithFormat:@"已完成:%.1f%%", _slider.value];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
