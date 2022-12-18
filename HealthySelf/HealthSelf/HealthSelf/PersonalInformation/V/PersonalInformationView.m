//
//  PersonalInformationView.m
//  HealthSelf
//
//  Created by 张佳慧 on 2022/12/17.
//

#import "PersonalInformationView.h"
#import "Masonry.h"
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "ThirdTableViewCell.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@implementation PersonalInformationView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor greenColor];
    
    UIView* headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SIZE_WIDTH, 100)];
    headView.backgroundColor = [UIColor whiteColor];
    [self addSubview:headView];
    
    _setButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_setButton setImage:[UIImage imageNamed:@"shezhi-7.png"] forState:UIControlStateNormal];
    [headView addSubview:_setButton];
    [_setButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(280);
        make.top.mas_equalTo(50);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    _messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_messageButton setImage:[UIImage imageNamed:@"xiaoxi.png"] forState:UIControlStateNormal];
    [headView addSubview:_messageButton];
    [_messageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(330);
        make.top.mas_equalTo(50);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    [self initTableView];
    return self;
}

-(void)initTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, SIZE_WIDTH, SIZE_HEIGHT-80) style:UITableViewStyleGrouped];
    _arrayData = [[NSMutableArray alloc] init];
    _tableView.backgroundColor = [UIColor yellowColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"first"];
    [_tableView registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"second"];
    [_tableView registerClass:[ThirdTableViewCell class] forCellReuseIdentifier:@"third"];
    [self addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 1;
    }
    if (section == 2) {
        return 6;
    }
    if (section == 3) {
        return 4;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        FirstTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    if (indexPath.section == 1) {
        SecondTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"second" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    if (indexPath.section == 2) {
        ThirdTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"third" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor whiteColor];
        if (indexPath.row == 0) {
            cell.label.text = @"健康方案";
            cell.labelImageView.image = [UIImage imageNamed:@"naozhong.png"];
        }
        if (indexPath.row == 1) {
            cell.label.text = @"饮食方案";
            cell.labelImageView.image = [UIImage imageNamed:@"linggandengpao.png"];
        }
        if (indexPath.row == 2) {
            cell.label.text = @"本周食谱";
            cell.labelImageView.image = [UIImage imageNamed:@"shipu.png"];
        }
        if (indexPath.row == 3) {
            cell.label.text = @"数据统计";
            cell.labelImageView.image = [UIImage imageNamed:@"shuju.png"];
        }
        if (indexPath.row == 4) {
            cell.label.text = @"上周小结";
            cell.labelImageView.image = [UIImage imageNamed:@"xiaojie.png"];
        }
        if (indexPath.row == 5) {
            cell.label.text = @"我的商品解决方案";
            cell.labelImageView.image = [UIImage imageNamed:@"shangpin.png"];
        }
        return cell;
    }
    if (indexPath.section == 3) {
        ThirdTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"third" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor whiteColor];
        if (indexPath.row == 0) {
            cell.label.text = @"健康测评";
            cell.labelImageView.image = [UIImage imageNamed:@"ceping.png"];
        }
        if (indexPath.row == 1) {
            cell.label.text = @"家人健康资料";
            cell.labelImageView.image = [UIImage imageNamed:@"ziliao.png"];
        }
        if (indexPath.row == 2) {
            cell.label.text = @"减重咨询";
            cell.labelImageView.image = [UIImage imageNamed:@"zixun2.png"];
        }
        if (indexPath.row == 3) {
            cell.label.text = @"帮助与反馈";
            cell.labelImageView.image = [UIImage imageNamed:@"bangzhu.png"];
        }
        return cell;
    }
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 200;
    }
    if (indexPath.section == 1) {
        return 150;
    }
    if (indexPath.section == 2) {
        return 70;
    }
    if (indexPath.section == 3) {
        return 70;
    }
    return 0;
}

@end
