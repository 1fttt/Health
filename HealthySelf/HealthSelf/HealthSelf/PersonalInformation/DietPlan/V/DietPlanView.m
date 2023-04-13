//
//  DietPlanView.m
//  HealthSelf
//
//  Created by 张佳慧 on 2023/2/3.
//

#import "DietPlanView.h"
#import "Masonry.h"
@implementation DietPlanView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    
    UIView* headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 100)];
    headView.backgroundColor = [UIColor whiteColor];
    [self addSubview:headView];
    
    UILabel* titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"更多饮食方案";
    titleLabel.font = [UIFont systemFontOfSize:19];
    [headView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bounds.size.width/2-57);
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
    [self initTableView];
    return self;
}
-(void)initTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.bounds.size.width, self.bounds.size.height-80) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor colorWithWhite:0.97 alpha:1];
    _arrayData = [[NSMutableArray alloc] init];
//    _tableView.backgroundColor = [UIColor colorWithWhite:1.15 alpha:0.8];
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.sectionHeaderHeight = 12;
    _tableView.sectionFooterHeight = 12;
    _tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 10, _tableView.bounds.size.width, 10)];//设置tableView上面留的空白
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self addSubview:_tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 9;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        UITableViewCell* cell = [[UITableViewCell alloc] init];
        cell.backgroundColor = [UIColor colorWithWhite:1.4 alpha:1];
        cell.layer.masksToBounds = YES;
        cell.layer.cornerRadius = 28;
        UILabel* classicDiet = [[UILabel alloc] init];
        classicDiet.text = @"经典均衡饮食";
        classicDiet.font = [UIFont systemFontOfSize:18];
        [cell.contentView addSubview:classicDiet];
        [classicDiet mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(50);
        }];
        
        UILabel* messageLable = [[UILabel alloc] init];
        messageLable.text = @"我的信息";
        messageLable.font = [UIFont systemFontOfSize:13];
        [cell.contentView addSubview:messageLable];
        [messageLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(40);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(50);
        }];
        
        UILabel* sentenceLabel = [[UILabel alloc] init];
        sentenceLabel.text = @"考虑到您目前处于塑形，从健康和操作难度角度，以下部分方案不建议使用。";
        sentenceLabel.font = [UIFont systemFontOfSize:10];
        sentenceLabel.textColor = [UIColor grayColor];
        [cell.contentView addSubview:sentenceLabel];
        [sentenceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(80);
            make.width.mas_equalTo(400);
            make.height.mas_equalTo(50);
        }];
        return cell;
    }
    if(indexPath.section == 1) {
        UITableViewCell* cell = [[UITableViewCell alloc] init];
        cell.backgroundColor = [UIColor clearColor];
        UILabel* titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"减肥有点厉害";
        titleLabel.textColor = [UIColor darkGrayColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [cell.contentView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(-10);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(50);
        }];
        
        UILabel* sentenceLabel = [[UILabel alloc] init];
        sentenceLabel.text = @"经研究证实有效的健康减肥法，短期使用，冲刺理想体重";
        sentenceLabel.textColor = [UIColor grayColor];
        sentenceLabel.font = [UIFont systemFontOfSize:13];
        [cell.contentView addSubview:sentenceLabel];
        [sentenceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(15);
            make.width.mas_equalTo(400);
            make.height.mas_equalTo(50);
        }];
        return cell;
    }
    if(indexPath.section == 3) {
        UITableViewCell* cell = [[UITableViewCell alloc] init];
        cell.backgroundColor = [UIColor clearColor];
        UILabel* titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"好健康系";
        titleLabel.textColor = [UIColor darkGrayColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [cell.contentView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(-10);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(50);
        }];
        
        UILabel* sentenceLabel = [[UILabel alloc] init];
        sentenceLabel.text = @"在健康上的长期投资，适用范围广，官方权威推荐";
        sentenceLabel.textColor = [UIColor grayColor];
        sentenceLabel.font = [UIFont systemFontOfSize:13];
        [cell.contentView addSubview:sentenceLabel];
        [sentenceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(15);
            make.width.mas_equalTo(400);
            make.height.mas_equalTo(50);
        }];
        return cell;
    }
    if(indexPath.section == 5) {
        UITableViewCell* cell = [[UITableViewCell alloc] init];
        cell.backgroundColor = [UIColor clearColor];
        UILabel* titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"运动党的爱";
        titleLabel.textColor = [UIColor darkGrayColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [cell.contentView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(-10);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(50);
        }];
        
        UILabel* sentenceLabel = [[UILabel alloc] init];
        sentenceLabel.text = @"为运动人群定制，塑形&增肌适用，轻松管理身材";
        sentenceLabel.textColor = [UIColor grayColor];
        sentenceLabel.font = [UIFont systemFontOfSize:13];
        [cell.contentView addSubview:sentenceLabel];
        [sentenceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(15);
            make.width.mas_equalTo(400);
            make.height.mas_equalTo(50);
        }];
        return cell;
    }
    if(indexPath.section == 7) {
        UITableViewCell* cell = [[UITableViewCell alloc] init];
        cell.backgroundColor = [UIColor clearColor];
        UILabel* titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"好治愈系";
        titleLabel.textColor = [UIColor darkGrayColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [cell.contentView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(-10);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(50);
        }];
        
        UILabel* sentenceLabel = [[UILabel alloc] init];
        sentenceLabel.text = @"不节食的美好生活提案～";
        sentenceLabel.textColor = [UIColor grayColor];
        sentenceLabel.font = [UIFont systemFontOfSize:13];
        [cell.contentView addSubview:sentenceLabel];
        [sentenceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(15);
            make.width.mas_equalTo(400);
            make.height.mas_equalTo(50);
        }];
        return cell;
    }
    if(indexPath.section == 2) {
        //轮播图
        UITableViewCell* cell = [[UITableViewCell alloc] init];
        UIImageView* firstImageview = [[UIImageView alloc] init];
        UIImage* firstImage = [UIImage imageNamed:@"1.JPG"];
        firstImageview.frame = CGRectMake(5, 5, 170, 200);
        UIImageView* secondImageview = [[UIImageView alloc] init];
        UIImage* secondImage = [UIImage imageNamed:@"2.jpg"];
        secondImageview.frame = CGRectMake(180, 5, 170, 200);
        UIImageView* thirdImageview = [[UIImageView alloc] init];
        UIImage* thirdImage = [UIImage imageNamed:@"3.JPG"];
        thirdImageview.frame = CGRectMake(355, 5, 170, 200);
//        UIImageView* forthImageview = [[UIImageView alloc] init];
//        UIImage* forthImage = [UIImage imageNamed:@"4.JPG"];
//        forthImageview.frame = CGRectMake(432, -5, 140, 165);
//        UIImageView* fifthImageview = [[UIImageView alloc] init];
//        UIImage* fifthImage = [UIImage imageNamed:@"5.JPG"];
//        fifthImageview.frame = CGRectMake(572, -5, 140, 165);
//        UIImageView* sixthImageview = [[UIImageView alloc] init];
//        UIImage* sixthImage = [UIImage imageNamed:@"6.JPG"];
//        sixthImageview.frame = CGRectMake(712, -5, 140, 165);
        firstImageview.image=firstImage;
        secondImageview.image=secondImage;
        thirdImageview.image=thirdImage;
//        forthImageview.image=forthImage;
//        fifthImageview.image=fifthImage;
//        sixthImageview.image=sixthImage;
        
        UIScrollView* scrollView= [[UIScrollView alloc] init];
//        scrollView.backgroundColor = [UIColor redColor];
        scrollView.frame = CGRectMake(0, 0,self.frame.size.width, 215);
        scrollView.bounces = NO;
        scrollView.pagingEnabled = NO;
//        scrollView.userInteractionEnabled = YES;
        scrollView.contentSize = CGSizeMake(175*3+5, 215);
        scrollView.pagingEnabled = YES;
        scrollView.scrollEnabled = YES;
//
        scrollView.backgroundColor = [UIColor whiteColor];
        [scrollView addSubview:firstImageview];
        [scrollView addSubview:secondImageview];
        [scrollView addSubview:thirdImageview];
//        [scrollView addSubview:forthImageview];
//        [scrollView addSubview:fifthImageview];
//        [scrollView addSubview:sixthImageview];
        [cell.contentView addSubview:scrollView];
        return cell;
    }
    if(indexPath.section == 4) {
        UITableViewCell* cell = [[UITableViewCell alloc] init];
        UIImageView* firstImageview = [[UIImageView alloc] init];
        UIImage* firstImage = [UIImage imageNamed:@"4.JPG"];
        firstImageview.frame = CGRectMake(5, 5, 170, 200);
        UIImageView* secondImageview = [[UIImageView alloc] init];
        UIImage* secondImage = [UIImage imageNamed:@"5.JPG"];
        secondImageview.frame = CGRectMake(180, 5, 170, 200);
        UIImageView* thirdImageview = [[UIImageView alloc] init];
        UIImage* thirdImage = [UIImage imageNamed:@"6.JPG"];
        thirdImageview.frame = CGRectMake(355, 5, 170, 200);
        UIImageView* forthImageview = [[UIImageView alloc] init];
        UIImage* forthImage = [UIImage imageNamed:@"7.JPG"];
        forthImageview.frame = CGRectMake(530, 5, 170, 200);
        UIImageView* fifthImageview = [[UIImageView alloc] init];
        UIImage* fifthImage = [UIImage imageNamed:@"8.JPG"];
        fifthImageview.frame = CGRectMake(705, 5, 170, 200);

        firstImageview.image=firstImage;
        secondImageview.image=secondImage;
        thirdImageview.image=thirdImage;
        forthImageview.image=forthImage;
        fifthImageview.image=fifthImage;
        
        UIScrollView* scrollView= [[UIScrollView alloc] init];
//        scrollView.backgroundColor = [UIColor redColor];
        scrollView.frame = CGRectMake(0, 0,self.frame.size.width, 215);
        scrollView.bounces = NO;
        scrollView.pagingEnabled = NO;
//        scrollView.userInteractionEnabled = YES;
        scrollView.contentSize = CGSizeMake(175*5+5, 215);
        scrollView.pagingEnabled = YES;
        scrollView.scrollEnabled = YES;

        scrollView.backgroundColor = [UIColor whiteColor];
        [scrollView addSubview:firstImageview];
        [scrollView addSubview:secondImageview];
        [scrollView addSubview:thirdImageview];
        [scrollView addSubview:forthImageview];
        [scrollView addSubview:fifthImageview];
        [cell.contentView addSubview:scrollView];
        return cell;
    }
    if (indexPath.section == 6) {
        UITableViewCell* cell = [[UITableViewCell alloc] init];
        UIImageView* firstImageview = [[UIImageView alloc] init];
        UIImage* firstImage = [UIImage imageNamed:@"1.JPG"];
        firstImageview.frame = CGRectMake(5, 5, 170, 200);
        firstImageview.image=firstImage;
        [cell.contentView addSubview:firstImageview];
        return cell;
    }
    if (indexPath.section == 8) {
        UITableViewCell* cell = [[UITableViewCell alloc] init];
        UIImageView* firstImageview = [[UIImageView alloc] init];
        UIImage* firstImage = [UIImage imageNamed:@"10.JPG"];
        firstImageview.frame = CGRectMake(5, 5, 170, 200);
        firstImageview.image=firstImage;
        [cell.contentView addSubview:firstImageview];
        return cell;
    }
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        return 140;
    }
    if(indexPath.section == 1) {
        return  50;
    }
    if(indexPath.section == 2) {
        return 215;
    }
    if(indexPath.section == 3) {
        return 50;
    }
    if(indexPath.section == 4) {
        return 215;
    }
    if(indexPath.section == 5) {
        return 50;
    }
    if(indexPath.section == 6) {
        return 215;
    }
    if(indexPath.section == 7) {
        return 50;
    }
    if(indexPath.section == 8) {
        return 215;
    }
    
    return 0;
}


@end
