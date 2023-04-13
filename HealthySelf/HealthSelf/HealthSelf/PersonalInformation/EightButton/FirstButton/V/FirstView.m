//
//  FirstView.m
//  HealthSelf
//
//  Created by 张佳慧 on 2023/4/11.
//

#import "FirstView.h"
#import "Masonry.h"
#define Width ([UIScreen mainScreen].bounds.size.width)
@implementation FirstView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    
    UIView* headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 100)];
    headView.backgroundColor = [UIColor whiteColor];
    [self addSubview:headView];
    
    UILabel* titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"更多饮食方案";
    titleLabel.font = [UIFont systemFontOfSize:19];
    [headView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Width/2-57);
        make.top.mas_equalTo(45);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    [headView addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.top.mas_equalTo(60);
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(24);
    }];
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 50, Width, 1000);
    _scrollView.contentSize = CGSizeMake(Width * 3, 100);
    _scrollView.pagingEnabled = YES;
   // _scrollview.scrollEnabled = NO;
    //self.scrollview.showsHorizontalScrollIndicator = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.alwaysBounceHorizontal = NO;
    _scrollView.alwaysBounceVertical = NO;
    _scrollView.bounces = YES;
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_scrollView];
    
    _segmentedControl = [[UISegmentedControl alloc] init];
    _segmentedControl.frame = CGRectMake(0, 100, Width, 50);
    [_segmentedControl insertSegmentWithTitle:@"待收货" atIndex:0 animated:YES];
    [_segmentedControl insertSegmentWithTitle:@"待付款" atIndex:1 animated:YES];
    [_segmentedControl insertSegmentWithTitle:@"待评价" atIndex:2 animated:YES];
    [_segmentedControl addTarget:self action:@selector(pressSegmented:) forControlEvents:UIControlEventValueChanged];
    _segmentedControl.selectedSegmentIndex = 0;
    [self addSubview:_segmentedControl];
    
//    _firsttableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, width, 800) style:UITableViewStylePlain];
//    _firsttableview.delegate = self;
//    _firsttableview.dataSource = self;
//    _firsttableview.tag = 1;
//    [_scrollview addSubview:_firsttableview];
    
//    _secondtableview = [[UITableView alloc] initWithFrame:CGRectMake(width, 50, width, 800) style:UITableViewStylePlain];
//    _secondtableview.delegate = self;
//    _secondtableview.dataSource = self;
//    _secondtableview.tag = 2;
//    [_scrollview addSubview:_secondtableview];
//
//    _thirdtableview = [[UITableView alloc] initWithFrame:CGRectMake(width * 2, 50, width, 800) style:UITableViewStylePlain];
//    _thirdtableview.delegate = self;
//    _thirdtableview.dataSource = self;
//    _thirdtableview.tag = 3;
//    [_scrollview addSubview:_thirdtableview];
    
//    [_firsttableview registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"2"];
//    [_secondtableview registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"2"];
//    [_thirdtableview registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"2"];
    return self;
}


- (void)pressSegmented:(UISegmentedControl*)segmented {
    if (_segmentedControl.selectedSegmentIndex == 0) {
        [_scrollView setContentOffset:CGPointMake(0, -40) animated:YES];
    } else if (_segmentedControl.selectedSegmentIndex == 1) {
        [_scrollView setContentOffset:CGPointMake(Width, -40) animated:YES];
    } else if (_segmentedControl.selectedSegmentIndex == 2) {
        [_scrollView setContentOffset:CGPointMake(Width * 2, -40) animated:YES];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_scrollView.contentOffset.x == 0) {
        _segmentedControl.selectedSegmentIndex = 0;
    } else if (_scrollView.contentOffset.x == Width) {
        _segmentedControl.selectedSegmentIndex = 1;
    } else if (_scrollView.contentOffset.x == Width * 2) {
        _segmentedControl.selectedSegmentIndex = 2;
    }
}



@end
