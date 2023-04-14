//
//  SetView.m
//  HealthSelf
//
//  Created by 张佳慧 on 2022/12/18.
//

#import "SetView.h"
#import "Masonry.h"
#import "SetTableViewCell.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@implementation SetView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self initTableView];
    _textArray = @[@[@"个人信息",@"收货地址",@"账号设置",@"偏好设置"],@[@"消息设置",@"管理Siri捷径",@"数据同步设置",@"清理缓存",@"网络诊断"],@[@"协议与条款",@"隐私政策摘要",@"个人信息收集清单",@"第三方信息共享清单"],@[@"推荐给朋友",@"商务合作",@"投诉举报",@"关于我们"]];
    
    UIView* headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SIZE_WIDTH, 100)];
    headView.backgroundColor = [UIColor whiteColor];
    [self addSubview:headView];
    
    UILabel* headLabel = [[UILabel alloc] init];
    headLabel.text = @"设置";
    headLabel.font = [UIFont boldSystemFontOfSize:20];
    headLabel.textAlignment = NSTextAlignmentCenter;
    [headView addSubview:headLabel];
    [headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(SIZE_WIDTH/2-47);
        make.top.mas_equalTo(50);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    [headView addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.mas_equalTo(50);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    return self;
}

- (void)initTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, SIZE_WIDTH, SIZE_HEIGHT-100) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor colorWithWhite:1.2 alpha:0.8];
    _arrayData = [[NSMutableArray alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [_tableView registerClass:[SetTableViewCell class] forCellReuseIdentifier:@"first"];
    [self addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    }
    if (section == 1) {
        return 5;
    }
    if (section == 2) {
        return 4;
    }
    if (section == 3) {
        return 4;
    }
    if (section == 4) {
        return 1;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section <4) {
        SetTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.label.text = _textArray[indexPath.section][indexPath.row];
        return cell;
    }
    
    
    
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = @"退出登录";
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    cell.textLabel.textColor = [UIColor redColor];
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 4) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Exit" object:nil];
    }
}
@end
