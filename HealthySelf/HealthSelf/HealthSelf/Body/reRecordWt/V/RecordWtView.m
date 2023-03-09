//
//  RecordWtView.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/3/2.
//

#import "RecordWtView.h"
#import <Masonry/Masonry.h>
#import "RulerView.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface RecordWtView()<RulerViewDelegate>
@property (nonatomic, strong) UIView *bottomBkView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *exitButton;
@property (nonatomic, strong) UIButton *addPhpButto;
@property (nonatomic, strong) UILabel *addLabel;
@property (nonatomic, strong) UIButton *getHKDataButton;
@property (nonatomic, strong) UIButton *recordButton;
@property (nonatomic, strong) UILabel *isShareLabel;
@property (nonatomic, strong) UIButton *isShareButton;

//rulerView
@property (nonatomic, strong) RulerView *numberBottomRulerView;                 //数字据下
@property (nonatomic, strong) UILabel *numberBottomRulerDefaultLabel;
@end
@implementation RecordWtView

- (void)viewInit {
    [self lazyBtmBkView];
    [self lazytmLabel];
    [self NowTime];
    [self lazyExitBtn];
    [self lazyAddPhpBtn];
    [self lazyAddLabel];
    [self lazyHkDataBtn];
    [self lazyRcdBtn];
    [self numberBottomRulerDefaultLabel];
    [self numberBottomRulerView];
    [self lazyIsShare];
    [self lazyIsShareBtn];
   
    
}
- (UIView *)lazyBtmBkView {
    if (!_bottomBkView) {
        _bottomBkView = [[UIView alloc] init];
        _bottomBkView.backgroundColor = [UIColor whiteColor];
        _bottomBkView.layer.masksToBounds = YES;
        _bottomBkView.layer.cornerRadius = 18.0;
        [self addSubview:_bottomBkView];
        [_bottomBkView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(@0);
            make.width.equalTo(@(ScreenWidth));
            make.left.equalTo(@0);
            make.height.equalTo(@450);
        }];
    }
    return _bottomBkView;
}
- (UILabel *)lazytmLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.text = @"今天 22:21";
        _timeLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
        [self.bottomBkView addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@15);
            make.left.equalTo(@(ScreenWidth / 2 - 33));
        }];
    }
    return _timeLabel;
}
- (UIButton *)lazyExitBtn {
    if (!_exitButton) {
        _exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_exitButton setImage:[UIImage imageNamed:@"cuowu.png"] forState:UIControlStateNormal];
        [_exitButton addTarget:self action:@selector(exitBtn) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomBkView addSubview:_exitButton];
        [_exitButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-20);
            make.top.equalTo(@10);
            make.width.equalTo(@17);
            make.height.equalTo(@17);
        }];
    }
    return _exitButton;
}
- (UIButton *)lazyAddPhpBtn {
    if (!_addPhpButto) {
        _addPhpButto = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addPhpButto setImage:[UIImage imageNamed:@"tianjia.png"] forState:UIControlStateNormal];
        [_addPhpButto addTarget:self action:@selector(addPhpBtn) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomBkView addSubview:_addPhpButto];
        [_addPhpButto mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([self.timeLabel mas_bottom]).offset(15);
            make.left.equalTo(@(ScreenWidth / 2 - 18));
            make.width.equalTo(@38);
            make.height.equalTo(@38);
        }];
    }
    return _addPhpButto;
}
- (UILabel *)lazyAddLabel {
    if (!_addLabel) {
        _addLabel = [[UILabel alloc] init];
        _addLabel.text = @"用照片记录改变";
        _addLabel.font = [UIFont systemFontOfSize:13];
        _addLabel.textColor = [UIColor grayColor];
        [self.bottomBkView addSubview:_addLabel];
        [_addLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([self.addPhpButto mas_bottom]).offset(10);
            make.left.equalTo(@(ScreenWidth / 2 - 43));
        }];
    }
    return _addLabel;
}
- (UIButton *)lazyHkDataBtn {
    UIColor *newBlue = [UIColor colorWithRed:94 / 255.0f green:186 / 255.0f blue:209 / 255.0f alpha:1.0];
    if (!_getHKDataButton) {
        _getHKDataButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_getHKDataButton setTitle:@"绑定手机数据" forState:UIControlStateNormal];
        _getHKDataButton.layer.masksToBounds = YES;
        _getHKDataButton.layer.cornerRadius = 14.0;
        _getHKDataButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
        _getHKDataButton.tintColor = [UIColor whiteColor];
        _getHKDataButton.backgroundColor = newBlue;
        [_getHKDataButton addTarget:self action:@selector(getHkData) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomBkView addSubview:_getHKDataButton];
        [_getHKDataButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-20);
            make.top.equalTo([self.addPhpButto mas_top]).offset(5);
            make.width.equalTo(@90);
            make.height.equalTo(@27);
        }];
    }
    return _getHKDataButton;
}
- (UIButton *)lazyRcdBtn {
    UIColor *newBlue = [UIColor colorWithRed:94 / 255.0f green:186 / 255.0f blue:209 / 255.0f alpha:1.0];
    if (!_recordButton) {
        _recordButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_recordButton setTitle:@"保存" forState:UIControlStateNormal];
        _recordButton.layer.masksToBounds = YES;
        _recordButton.layer.cornerRadius = 19.0;
        _recordButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        _recordButton.tintColor = [UIColor whiteColor];
        _recordButton.backgroundColor = newBlue;
        [_recordButton addTarget:self action:@selector(changeWt) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomBkView addSubview:_recordButton];
        [_recordButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@35);
            make.bottom.equalTo(@-95);
            make.width.equalTo(@(ScreenWidth - 70));
            make.height.equalTo(@45);
        }];
    }
    return _getHKDataButton;
}
- (UILabel *)numberBottomRulerDefaultLabel {
    UIColor *newBlue = [UIColor colorWithRed:94 / 255.0f green:186 / 255.0f blue:209 / 255.0f alpha:1.0];
    if (!_numberBottomRulerDefaultLabel) {
        _numberBottomRulerDefaultLabel = [[UILabel alloc] init];
        _numberBottomRulerDefaultLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
        _numberBottomRulerDefaultLabel.textColor =newBlue;
        _numberBottomRulerDefaultLabel.textAlignment = NSTextAlignmentCenter;
        [self.bottomBkView addSubview:_numberBottomRulerDefaultLabel];
        [_numberBottomRulerDefaultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([self.addLabel mas_bottom]).offset(15);
            make.left.equalTo([self.addLabel mas_left]).offset(18);
        }];
    }
    return _numberBottomRulerDefaultLabel;
}
- (RulerView *)numberBottomRulerView {
    if (!_numberBottomRulerView) {
        _numberBottomRulerView = [[RulerView alloc] initWithFrame:CGRectMake(0, 220, SCREEN_WIDTH_RULER, 100)];
        _numberBottomRulerView.backgroundColor = [UIColorFromHex(0xE4E6EB) colorWithAlphaComponent:0.3f];
        _numberBottomRulerView.tag = 1;
        _numberBottomRulerView.delegate = self;
        RulerConfig *config = [[RulerConfig alloc] init];
        //刻度高度
        config.shortScaleLength = 17.5;
        config.longScaleLength = 25;
        //刻度宽度
        config.scaleWidth = 2;
        //刻度起始位置
        config.shortScaleStart = 25;
        config.longScaleStart = 25;
        //刻度颜色
        config.scaleColor = UIColorFromHex(0xdae0ed);
        //刻度之间的距离
        config.distanceBetweenScale = 8;
        //刻度距离数字的距离
        config.distanceFromScaleToNumber = 35;
        //指示视图属性设置
        config.pointSize = CGSizeMake(4, 40);
        config.pointColor = UIColorFromHex(0x20c6ba);
        config.pointStart = 20;
        //文字属性
        config.numberFont = [UIFont systemFontOfSize:11];
        config.numberColor = UIColorFromHex(0x617272);
        //数字所在位置方向
        config.numberDirection = numberBottom;
        
        //取值范围
        config.max = 120;
        config.min = 40;
        //默认值
        config.defaultNumber = 10;
        config.infiniteLoop = YES;
        config.offset = 5;
        _numberBottomRulerView.rulerConfig = config;
        [self.bottomBkView addSubview:_numberBottomRulerView];
        [_numberBottomRulerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(SCREEN_WIDTH_RULER));
            make.height.equalTo(@80);
            make.top.equalTo([self.numberBottomRulerDefaultLabel mas_bottom]).offset(10);
            make.left.equalTo(@0);
            
        }];
    }
    return _numberBottomRulerView;
}
- (UILabel *)lazyIsShare {
    if (!_isShareLabel) {
        _isShareLabel = [[UILabel alloc] init];
        _isShareLabel.text = @"与朋友共享我的数据";
        _isShareLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        _isShareLabel.textColor = [UIColor grayColor];
        [self.bottomBkView addSubview:_isShareLabel];
        [_isShareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([self.numberBottomRulerView mas_bottom]).offset(20);
            make.left.equalTo(@(18));
        }];
    }
    return _isShareLabel;
}
- (UIButton *)lazyIsShareBtn {
    if (!_isShareButton) {
        _isShareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _isShareButton.tag = 120;
        [_isShareButton setImage:[UIImage imageNamed:@"weixuanzhong.png"] forState:UIControlStateNormal];
        [_isShareButton addTarget:self action:@selector(seleMeth:) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomBkView addSubview:_isShareButton];
        [_isShareButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo([self.numberBottomRulerView mas_bottom]).offset(16);
            make.right.equalTo(@-28);
            make.width.equalTo(@32);
            make.height.equalTo(@32);
        }];
    }
    return _isShareButton;
}
#pragma mark -BtnMethod
- (void)exitBtn {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"exit" object:nil userInfo:nil];
}
- (void)addPhpBtn {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addPhp" object:nil userInfo:nil];
}
- (void)getHkData {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GetHkData" object:nil];
}
- (void)changeWt {
    NSDictionary *_wtDict = @{@"weight" : self.numberBottomRulerDefaultLabel.text};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeWt" object:nil userInfo:_wtDict];
}
#pragma mark -Time
- (void)NowTime {
    NSDate *date = [NSDate date]; // 获得时间对象
    NSDateFormatter *forMatter = [[NSDateFormatter alloc] init];
    [forMatter setDateFormat:@"今天HH:mm"];
    NSString *dateStr = [forMatter stringFromDate:date];
    self.timeLabel.text = dateStr;
}
- (void)rulerSelectValue:(double)value tag:(NSInteger)tag {
    if (tag == 1) {
        self.numberBottomRulerDefaultLabel.text = [NSString stringWithFormat:@"%li公斤", (long)value];
    }
   
}

- (void)seleMeth:(UIButton *)button {
    if (button.tag == 120) {
        button.tag = 121;
        [button setImage:[UIImage imageNamed:@"danxuanxuanzhong.png"] forState:UIControlStateNormal];
    } else {
        button.tag = 120;
        [button setImage:[UIImage imageNamed:@"weixuanzhong.png"] forState:UIControlStateNormal];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
