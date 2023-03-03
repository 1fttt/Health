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
@interface BodyView()<UITextFieldDelegate>
// part-0 btset
@property (nonatomic, strong) UIView *topBackView;
@property (nonatomic, strong) UIButton *makeFrdButton;
@property (nonatomic, strong) UIButton *scanButton;
@property (nonatomic, strong) UITextField *searchField;
@property (nonatomic, strong) UIImageView *topSchView;
// part-1 wtNum
@property (nonatomic, strong) UIView *weightBackView;
@property (nonatomic, strong) UILabel *weightTlLabel;
@property (nonatomic, strong) UIButton *isWtHidenButton;
@property (nonatomic, strong) UILabel *unitLabel;
@property (nonatomic, strong) UILabel *progressLabel;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UILabel *sliderLabel;
@property (nonatomic, strong) UILabel *chLabel;
@property (nonatomic, strong) UILabel *stWtNumLabel;
@property (nonatomic, strong) UILabel *crtWtNumLabel;
@property (nonatomic, strong) UILabel *TrtwtNumLabel;
@property (nonatomic, strong) UIButton *changeWtButton;
@property (nonatomic, strong) UITextField *topSrhTxtFld;
@end
@implementation BodyView

- (void)viewInit {
    UIColor *newBackGroundGray = [UIColor colorWithRed:246 / 255.0f green: 247 / 255.0f blue: 250 / 255.0f alpha:1.0];
    self.backgroundColor = newBackGroundGray;
    
    [self lazyTopView];
    [self lazyMkFrdButton];
    [self lazyScanButton];
    [self lazyTopTxeFld];
    [self lazyTopSrchView];
    
    [self lazywtBackView];
    [self lazywtTLabel];
    [self lazyWtHidButton];
    [self lazyUnitTLabel];
    [self lazyPrgLabel];
    [self lazySlider];
    [self lazySldLabel];
    [self lazyChLabel];
    [self lazywtTLabel];
    [self lazySwt];
    [self lazyCwt];
    [self lazyTwt];
    [self lazyChagWtBt];
    
}
# pragma mark- LazyMethod
- (UIView *)lazyTopView {
    if (!_topBackView) {
        _topBackView = [[UIView alloc] init];
        _topBackView.backgroundColor = [UIColor whiteColor];
        _topBackView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight / 9);
        [self addSubview:_topBackView];
    }
    return _topBackView;
}
- (UIButton *)lazyMkFrdButton {
    if (!_makeFrdButton) {
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
    }
    return _makeFrdButton;
}
- (UIButton *)lazyScanButton {
    if (!_scanButton) {
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
    }
    
    return _scanButton;
}
- (UITextField *)lazyTopTxeFld {
    UIColor *newBackGroundGray = [UIColor colorWithRed:240 / 255.0f green: 240 / 255.0f blue: 242 / 255.0f alpha:1.0];
    if (!_topSrhTxtFld) {
        _topSrhTxtFld = [[UITextField alloc] init];
        _topSrhTxtFld.placeholder = @"         搜索食物营养和热量";
        _topSrhTxtFld.layer.masksToBounds = YES;
        _topSrhTxtFld.layer.cornerRadius = 18.0;
        _topSrhTxtFld.layer.borderWidth = 2.0;
        _topSrhTxtFld.layer.borderColor = [UIColor whiteColor].CGColor;
        _topSrhTxtFld.backgroundColor  = newBackGroundGray;
        // textField协议
        _topSrhTxtFld.delegate = self;
        [_topBackView addSubview: _topSrhTxtFld];
        [_topSrhTxtFld mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@25);
            make.height.equalTo(@35);
            make.width.equalTo(@(ScreenWidth / 3 * 2 - 10));
            make.bottom.equalTo([self.topBackView mas_bottom]).offset(-5);
        }];
    }
    
    return _topSrhTxtFld;;
}
- (UIImageView *)lazyTopSrchView {
    if (!_topSchView) {
        _topSchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chaxun.png"]];
        [self.topSrhTxtFld addSubview:_topSchView];
        [_topSchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@8);
            make.left.equalTo(@11);
            make.height.equalTo(@17);
            make.width.equalTo(@17);
        }];
    }
    return _topSchView;
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
    if (!_isWtHidenButton) {
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
    }
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
    if (!_slider) {
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
    }
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
// wtNumlabel
- (UILabel *)lazySwt {
    if (!_stWtNumLabel) {
        _stWtNumLabel = [[UILabel alloc] init];
        _stWtNumLabel.text = @"89.74";
        _stWtNumLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        [_weightBackView addSubview:_stWtNumLabel];
        [_stWtNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([self.slider mas_bottom]).offset(22);
            make.left.equalTo(@14);
        }];
    }
    return _stWtNumLabel;
}
- (UILabel *)lazyCwt {
    if (!_crtWtNumLabel) {
        _crtWtNumLabel = [[UILabel alloc] init];
        _crtWtNumLabel.text = @"82.18";
        _crtWtNumLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        [_weightBackView addSubview:_crtWtNumLabel];
        [_crtWtNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([self.slider mas_bottom]).offset(22);
            make.left.equalTo(@(14 + ScreenWidth / 3));
        }];
    }
    return _crtWtNumLabel;
}
- (UILabel *)lazyTwt {
    if (!_TrtwtNumLabel) {
        _TrtwtNumLabel = [[UILabel alloc] init];
        _TrtwtNumLabel.text = @"76.10";
        _TrtwtNumLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        [_weightBackView addSubview:_TrtwtNumLabel];
        [_TrtwtNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([self.slider mas_bottom]).offset(22);
            make.left.equalTo(@(14 + ScreenWidth/3  * 2));
        }];
    }
    return _TrtwtNumLabel;
}
- (UIButton *)lazyChagWtBt {
    if (!_changeWtButton) {
        _changeWtButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_changeWtButton setImage:[UIImage imageNamed:@"xie.png"] forState:UIControlStateNormal];
        [_changeWtButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        _changeWtButton.tag = 2;
        [_weightBackView addSubview:_changeWtButton];
        [_changeWtButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([self.crtWtNumLabel mas_top]).offset(2);
            make.left.equalTo([self.crtWtNumLabel mas_right]).offset(3);
            make.width.equalTo(@16);
            make.height.equalTo(@16);
        }];
    }
    return _changeWtButton;;
    
}
#pragma mark -rsp Method
- (void)pressButton:(UIButton *)button {
    if (button.tag == 0) {
        button.tag = 1;
        [button setImage:[UIImage imageNamed:@"biyanjing-2.png"] forState:UIControlStateNormal];
        [self wtLabelHidden];
    } else if (button.tag == 1){
        button.tag = 0;
        [button setImage:[UIImage imageNamed:@"yanjing-2.png"] forState:UIControlStateNormal];
        [self wtLabelNoHidden];
    } else if(button.tag == 2){
        /*注册通知并发送*/
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ToCgWtView" object:nil userInfo:nil];
    }
}
- (void)wtLabelHidden {
    self.crtWtNumLabel.text = @"*****";
    self.stWtNumLabel.text = @"*****";
    self.TrtwtNumLabel.text = @"*****";
}
- (void)wtLabelNoHidden {
    self.crtWtNumLabel.text = @"89.74";
    self.stWtNumLabel.text = @"82.18";
    self.TrtwtNumLabel.text = @"76.10";
}
- (void)goSlider {
    _sliderLabel.text = [NSString stringWithFormat:@"已完成:%.1f%%", _slider.value];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    /*注册通知并发送*/
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BodyToSearchFoodView" object:nil userInfo:nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
