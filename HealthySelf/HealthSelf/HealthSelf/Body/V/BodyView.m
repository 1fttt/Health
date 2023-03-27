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
@property (nonatomic, strong) UIButton *mapBtn;
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
@property (nonatomic, strong) UILabel *TrtwtNumLabel;
@property (nonatomic, strong) UIButton *changeWtButton;
@property (nonatomic, strong) UITextField *topSrhTxtFld;

// part2 - dietBlanced
@property (nonatomic, strong) UIButton *dietBalButton;

@property (nonatomic, strong) UIView *blcdBackView;
@property (nonatomic, strong) UILabel *blcdLabel;
@property (nonatomic, strong) UIButton *blckTodayBtn;
// 饮食摄入
@property (nonatomic, strong) UILabel *intakeTitleLbl;
@property (nonatomic, strong) UILabel *intakeLbl;
//运动消耗
@property (nonatomic, strong) UILabel *consumptionTitleLbl;
@property (nonatomic, strong) UILabel *consumptionLbl;
//还可以摄入
@property (nonatomic, strong) UIImageView *cricleView;
@property (nonatomic, strong) UILabel *eatNumLabel;
@property (nonatomic, strong) UILabel *requesrLabel;
@property (nonatomic, strong) UILabel *lineLbl;

@property (nonatomic, strong) UILabel *detailsLabel;
@property (nonatomic, strong) UIButton *detailsBtn;
@end
@implementation BodyView

- (void)viewInit {
    UIColor *newBackGroundGray = [UIColor colorWithRed:246 / 255.0f green: 247 / 255.0f blue: 250 / 255.0f alpha:1.0];
    self.backgroundColor = newBackGroundGray;
    self.weightArray = @[@"82.18", @"89.74", @"76.10"];
    [self lazyTopView];
    [self lazyMkFrdButton];
    [self lazyScanButton];
    [self lazyTopTxeFld];
    [self lazyTopSrchView];
    [self lazyMapBtn];
    
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
    
    //p3
    [self lazyDietBtn];
    [self lazyBlckBView];
    [self LazyBlcdLbl];
    [self lazyBlckBtn];
    [self lazyIntakeTl];
    [self lazyIntakeLbl];
    [self lazyConsumyTl];
    [self lazyConsumyLbl];
    [self lazyCriView];
    [self lazyEatNum];
    [self lazyRequest];
    [self lazyLineLbl];
    [self lazyDtsLbl];
    [self lazyDtsBtn];
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
            make.right.equalTo(@-90);
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
- (UIButton *)lazyMapBtn {
    if (!_mapBtn) {
        _mapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_mapBtn setImage:[UIImage imageNamed:@"dingwei.png"] forState:UIControlStateNormal];
        [_mapBtn addTarget:self action:@selector(toMap) forControlEvents:UIControlEventTouchUpInside];
        _mapBtn.tag = 999;
        [self.topBackView addSubview:_mapBtn];
        [_mapBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(@-12);
            make.right.equalTo(@-55);
            make.width.equalTo(@24);
            make.height.equalTo(@24);
        }];
    }
    
    return _mapBtn;
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
        _stWtNumLabel.text = self.weightArray[0];
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
        _crtWtNumLabel.text = self.weightArray[1];
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
        _TrtwtNumLabel.text = self.weightArray[2];
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

#pragma mark -P3
- (UIButton *)lazyDietBtn {
    if (!_dietBalButton) {
        _dietBalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_dietBalButton setImage:[UIImage imageNamed:@"WechatIMG469.jpeg"] forState:UIControlStateNormal];
        [_dietBalButton addTarget:self action:@selector(toBladDietView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_dietBalButton];
        [_dietBalButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([self.weightBackView mas_bottom]).offset(15);
            make.left.equalTo(@20);
            make.width.equalTo(@(ScreenWidth - 30));
            make.height.equalTo(@((ScreenWidth - 40) / 5 - 5));
        }];
    }
    return _dietBalButton;;
}
- (UIView *)lazyBlckBView {
    if (!_blcdBackView) {
        _blcdBackView = [[UIView alloc] init];
        _blcdBackView.backgroundColor = [UIColor whiteColor];
        _blcdBackView.layer.masksToBounds = YES;
        _blcdBackView.layer.cornerRadius = 18.0;
        [self addSubview:_blcdBackView];
        [_blcdBackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([self.dietBalButton mas_bottom]).offset(-10);
            make.height.equalTo(@260);
            make.left.equalTo(@20);
            make.width.equalTo(@(ScreenWidth - 35));
        }];
    }
    return _blcdBackView;
}
- (UILabel *)LazyBlcdLbl {
    if (!_blcdLabel) {
        _blcdLabel = [[UILabel alloc] init];
        _blcdLabel.text = @"饮食运动记录";
        _blcdLabel.font = [UIFont systemFontOfSize:14];
        [_blcdBackView addSubview:_blcdLabel];
        [_blcdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@15);
            make.top.equalTo(@20);
        }];
    }
    return _blcdLabel;
}
- (UIButton *)lazyBlckBtn {
    if (!_blckTodayBtn) {
        _blckTodayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_blckTodayBtn setImage:[UIImage imageNamed:@"WechatIMG504.jpeg"] forState:UIControlStateNormal];
        [_blckTodayBtn addTarget:self action:@selector(toBladDietView) forControlEvents:UIControlEventTouchUpInside];
        [_blcdBackView addSubview:_blckTodayBtn];
        [_blckTodayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@20);
            make.right.equalTo(@-20);
            make.width.equalTo(@80);
            make.height.equalTo(@25);
        }];
    }
    return _blckTodayBtn;
}
- (UILabel *)lazyIntakeTl {
    if (!_intakeTitleLbl) {
        _intakeTitleLbl = [[UILabel alloc] init];
        _intakeTitleLbl.text = @"饮食摄入";
        _intakeTitleLbl.font = [UIFont systemFontOfSize:11];
        [_blcdBackView addSubview:_intakeTitleLbl];
        [_intakeTitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@55);
            make.top.equalTo(@95);
        }];
    }
    return _intakeTitleLbl;
}
- (UILabel *)lazyIntakeLbl {
    if (!_intakeLbl) {
        _intakeLbl = [[UILabel alloc] init];
        _intakeLbl.text = @"0";
        _intakeLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
        [_blcdBackView addSubview:_intakeLbl];
        [_intakeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@70);
            make.top.equalTo([self.intakeTitleLbl mas_bottom]).offset(10);
        }];
    }
    return _intakeLbl;
}
- (UILabel *)lazyConsumyTl {
    if (!_consumptionTitleLbl) {
        _consumptionTitleLbl = [[UILabel alloc] init];
        _consumptionTitleLbl.text = @"运动消耗";
        _consumptionTitleLbl.font = [UIFont systemFontOfSize:11];
        [_blcdBackView addSubview:_consumptionTitleLbl];
        [_consumptionTitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-55);
            make.top.equalTo(@95);
        }];
    }
    return _consumptionTitleLbl;
}
- (UILabel *)lazyConsumyLbl {
    if (!_consumptionLbl) {
        _consumptionLbl = [[UILabel alloc] init];
        _consumptionLbl.text = @"0";
        _consumptionLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
        [_blcdBackView addSubview:_consumptionLbl];
        [_consumptionLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-70);
            make.top.equalTo([self.intakeTitleLbl mas_bottom]).offset(10);
        }];
    }
    return _consumptionLbl;
}
- (UIImageView *)lazyCriView {
    if (!_cricleView) {
        _cricleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yuanhuan.png"]];
        [_blcdBackView addSubview:_cricleView];
        [_cricleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([self.blcdLabel mas_bottom]).offset(28);
            make.left.equalTo([self.blcdLabel mas_right]).offset(17);
            make.height.equalTo(@130);
            make.width.equalTo(@130);
        }];
    }
    return _cricleView;
}
- (UILabel *)lazyEatNum {
    if (!_eatNumLabel) {
        _eatNumLabel = [[UILabel alloc] init];
        _eatNumLabel.text = @"2678";
        _eatNumLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:21];
        [_cricleView addSubview:_eatNumLabel];
        [_eatNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@35);
            make.top.equalTo(@30);
        }];
    }
    return _eatNumLabel;
}
- (UILabel *)lazyRequest {
    if (!_requesrLabel) {
        _requesrLabel = [[UILabel alloc] init];
        _requesrLabel.textColor = [UIColor grayColor];
        _requesrLabel.text = @"推荐食用热量";
        _requesrLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
        [_cricleView addSubview:_requesrLabel];
        [_requesrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@23);
            make.top.equalTo([self.eatNumLabel mas_bottom]).offset(10);
        }];
    }
    return _requesrLabel;
}
- (UILabel *)lazyLineLbl {
    _lineLbl = [[UILabel alloc] init];
    _lineLbl.text = @"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ";
    _lineLbl.textColor = [UIColor grayColor];
    [_blcdBackView addSubview:_lineLbl];
    [_lineLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo([self.cricleView mas_bottom]).offset(-10);
    }];
    return _lineLbl;
}
- (UILabel *)lazyDtsLbl {
    NSArray *array = @[@"早餐", @"午餐", @"晚餐", @"加餐", @"运动"];
    if (!_detailsLabel) {
        for (int i = 0; i < 5; i++) {
            _detailsLabel = [[UILabel alloc] init];
            _detailsLabel.text = array[i];
            _detailsLabel.font = [UIFont systemFontOfSize:11];
            [_blcdBackView addSubview:_detailsLabel];
            [_detailsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@(33 + ScreenWidth / 6 * i));
                make.top.equalTo([self.lineLbl mas_bottom]).offset(35);
            }];
        }
    }
    return _detailsLabel;
}
- (UIButton *)lazyDtsBtn {
    NSArray *array = @[@"zaocan.png", @"zhushi-2.png", @"kafei.png", @"hanbao.png", @"huwai.png"];
    if (!_detailsBtn) {
        for (int i = 0; i < 5; i++) {
            _detailsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [_detailsBtn setImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
            _detailsBtn.tag = 300 + i;
            [_detailsBtn addTarget:self action:@selector(blcdBtn:) forControlEvents:UIControlEventTouchUpInside];
            [_blcdBackView addSubview:_detailsBtn];
            [_detailsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@(30 + ScreenWidth / 6 * i));
                make.top.equalTo([self.lineLbl mas_bottom]).offset(2);
                make.width.equalTo(@29);
                make.height.equalTo(@29);
            }];
        }
    }
    return _detailsBtn;
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
    self.crtWtNumLabel.text = self.weightArray[1];
    self.stWtNumLabel.text = self.weightArray[0];
    self.TrtwtNumLabel.text = self.weightArray[2];
}
- (void)goSlider {
    _sliderLabel.text = [NSString stringWithFormat:@"已完成:%.1f%%", _slider.value];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    /*注册通知并发送*/
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BodyToSearchFoodView" object:nil userInfo:nil];
}
- (void)toBladDietView {
    /*注册通知并发送*/
    [[NSNotificationCenter defaultCenter] postNotificationName:@"toBlcdDietView" object:nil userInfo:nil];
}
- (void)newBackSet {
    UIColor *newBlue = [UIColor colorWithRed:94 / 255.0f green:186 / 255.0f blue:209 / 255.0f alpha:1.0];
    //通过CAGradientLayer 设置渐变的背景。
   CAGradientLayer *layer = [CAGradientLayer new];
   //colors存放渐变的颜色的数组
   layer.colors=@[(__bridge id)newBlue.CGColor,(__bridge id)[UIColor whiteColor].CGColor];
   /**
    * 起点和终点表示的坐标系位置，(0,0)表示左上角，(1,1)表示右下角
    */
   layer.startPoint = CGPointMake(0.2, 0);
   layer.endPoint = CGPointMake(0.5, 1);
   layer.frame = self.bounds;
   [self.layer addSublayer:layer];

}
- (void)blcdBtn:(UIButton *)blcdBtn {
    NSLog(@"%ld", blcdBtn.tag);
}
- (void)toMap {
    NSLog(@"to MapView");
    /*注册通知并发送*/
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ToMapView" object:nil userInfo:nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
