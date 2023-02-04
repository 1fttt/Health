//
//  ViewCommunityShare.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/12.
//

#import "CommitShareView.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
#define MaxSize 36
#import "Masonry.h"
#import "TableViewCellTop.h"
#import <SDWebImage/SDWebImage.h>
@interface CommitShareView() <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) UILabel* labelMonth;
@property (nonatomic, strong) UILabel* labelDay;
@property (nonatomic, strong) UILabel* labelTitle;
@property (nonatomic, strong) UIView* viewShu;
@property (nonatomic, strong) UIButton* buttonShare;
@property (nonatomic, strong) NSArray* arrayMonth;
@property (nonatomic, strong) TableViewCellTop* cellTop;
@property (nonatomic, strong) UITableView* tableView;
@end
@implementation CommitShareView
- (void)viewInit {
    [self setTopView];
    [self creatTableView];
}
#pragma mark TableView
- (void)creatTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tag = 777;
    [self.tableView registerClass:[TableViewCellTop class] forCellReuseIdentifier:@"top"];
    [self.tableView reloadData];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.tableView];
    [self.tableView reloadData];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(120);
        make.left.equalTo(self).offset(0);
        make.width.equalTo(@(Width));
        make.height.equalTo(@(Height - 100));
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return  1;
    }
    return 0;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *newPicArray;
    newPicArray = @[@"newsPic.jpeg", @"newsPic3.jpeg", @"newsPic4.jpeg", @"newsPic5.jpeg", @"newPic2.jpeg"];
    UIColor* newGray = [UIColor colorWithRed:222.0f/255.0f green:230.0f/255.0f blue:238.0f/255.0f alpha:1.0f];
    if (indexPath.section == 0) {
        TableViewCellTop* topCell = [self.tableView dequeueReusableCellWithIdentifier:@"top"];
        for (int i = 0; i < 7; i++) {
            UIImageView* _imageViewCurrent = [[UIImageView alloc] init];
            _imageViewCurrent.frame = CGRectMake(Width * i, 0, Width, Width / 2);
            [topCell.scrollview addSubview:_imageViewCurrent];
            _imageViewCurrent.tag = i;
            // image点击事件
            [_imageViewCurrent setUserInteractionEnabled: YES];
            [_imageViewCurrent addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressImage:)]];
            _imageViewCurrent.tag = i;
            
            UILabel* _labelTitle = [[UILabel alloc] init];
            _labelTitle = [[UILabel alloc] init];
            _labelTitle.font = [UIFont systemFontOfSize:22];
            _labelTitle.numberOfLines = 0;
            _labelTitle.textColor = [UIColor blackColor];
            _labelTitle.frame = CGRectMake(12 + Width * i, 100, Width * 3 / 4, 60);
            [topCell.scrollview addSubview:_labelTitle];
            
            UILabel* _labelSmall = [[UILabel alloc] init];
            _labelSmall = [[UILabel alloc] init];
            _labelSmall.font = [UIFont systemFontOfSize:14];
            _labelSmall.numberOfLines = 0;
            _labelSmall.textColor = [UIColor grayColor];
            _labelSmall.frame = CGRectMake(12 + Width * i, 160, Width / 5 * 4, 20);
            _labelSmall.textColor = newGray;
            [topCell.scrollview addSubview:_labelSmall];
            if (i > 0 && i < 6) {
                [_imageViewCurrent setImage:[UIImage imageNamed:newPicArray[i - 1]]];
                _labelTitle.text = self.topNewsDictionary[@"result"][@"newslist"][i - 1][@"title"];
                _labelSmall.text = self.topNewsDictionary[@"result"][@"newslist"][i - 1][@"description"];
            } else if (i == 0) {
                [_imageViewCurrent setImage:[UIImage imageNamed:newPicArray[4]]];
                _labelTitle.text = self.topNewsDictionary[@"result"][@"newslist"][4][@"title"];
                _labelSmall.text = self.topNewsDictionary[@"result"][@"newslist"][4][@"description"];
            } else if (i == 6) {
                [_imageViewCurrent setImage:[UIImage imageNamed:newPicArray[0]]];
                _labelTitle.text = self.topNewsDictionary[@"result"][@"newslist"][0][@"title"];
                _labelSmall.text = self.topNewsDictionary[@"result"][@"newslist"][0][@"description"];
            }
        }
        return topCell;
    } 
    return  0;
}
// 点击新闻界面
- (void)pressImage:(UITapGestureRecognizer*)gesTrueRecognizer {
    NSInteger nowTag = gesTrueRecognizer.view.tag;
    NSLog(@"%ld", nowTag);
    if (nowTag == 0) {
        [self.newsDelegate returnNewsPage:4];
    } else if (nowTag == 6) {
        [self.newsDelegate returnNewsPage:0];
    } else {
        [self.newsDelegate returnNewsPage:nowTag - 1];
    }
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return Width / 2 + 20;
    }
    return 0;
}
# pragma mark SetTopView
- (void)setTopView {
    UIColor *newGreen = [UIColor colorWithRed:184 / 255.0f green:229 / 255.0f blue:199 / 255.0f alpha:1.0];
    self.backgroundColor = [UIColor whiteColor];
    _arrayMonth = [NSArray arrayWithObjects:@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月", nil];
    // 日期
    _labelDay = [[UILabel alloc] init];
    _labelDay.font = [UIFont systemFontOfSize:25];
    [self addSubview:_labelDay];
    [_labelDay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(60);
        make.left.equalTo(self).offset(25);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    _labelMonth = [[UILabel alloc] init];
    _labelMonth.font = [UIFont systemFontOfSize:15];
    [self addSubview:_labelMonth];
    [_labelMonth mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(67);
        make.left.equalTo(self).offset(25);
        make.width.equalTo(@80);
        make.height.equalTo(@70);
    }];
    
    self.labelTitle = [[UILabel alloc] init];
    self.labelTitle.layer.masksToBounds = YES;
    self.labelTitle.layer.cornerRadius = 18.0;
    self.labelTitle.textAlignment = NSTextAlignmentCenter;
    self.labelTitle.textColor = [UIColor blackColor];
    self.labelTitle.backgroundColor = newGreen;
    self.labelTitle.text = @"健康广场";
    self.labelTitle.font = [UIFont systemFontOfSize:20];
    [self addSubview:self.labelTitle];
    [self.labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(65);
        make.left.equalTo(self).offset(100);
        make.height.equalTo(@40);
        make.width.equalTo(@110);
    }];
    
    _viewShu = [[UIView alloc] init];
    _viewShu.backgroundColor = [UIColor grayColor];
    [self addSubview:_viewShu];
    [_viewShu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(62);
        make.left.equalTo(self).offset(74);
        make.width.equalTo(@1);
        make.height.equalTo(@48);
    }];
    // 朋友圈button
    _buttonShare = [[UIButton alloc] init];
    _buttonShare.tag = 1;
    [_buttonShare setImage:[UIImage imageNamed:@"zengjia.png"] forState:UIControlStateNormal];
    _buttonShare.layer.cornerRadius = MaxSize / 2;
    _buttonShare.layer.masksToBounds = YES;
    [_buttonShare addTarget: self action:@selector(PressButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_buttonShare];
    [_buttonShare mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(63);
        make.right.equalTo(self).offset(-15);
        make.width.equalTo(@MaxSize);
        make.height.equalTo(@MaxSize);
    }];
    [self Data];
}
- (void)Data {
    //获得系统时间
    NSDate *  senddate=[NSDate date];
    //获得系统日期
    NSCalendar  * cal=[NSCalendar  currentCalendar];
    NSUInteger  unitFlags= NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear;
    NSDateComponents * conponent= [cal components:unitFlags fromDate:senddate];
    NSInteger month = [conponent month];
    NSInteger day = [conponent day];
    NSString* day1 = [NSString stringWithFormat:@"%ld", (NSInteger)day];
    _labelDay.text = day1;
    NSString* month1 = _arrayMonth[month - 1];
    _labelMonth.text = month1;
}
#pragma  mark ButtonMethods
-  (void)PressButton:(UIButton *)button {
    [self.delegate returnButton:button];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
