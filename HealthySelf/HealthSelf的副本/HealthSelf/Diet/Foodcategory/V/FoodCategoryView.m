//
//  FoodCategoryView.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/5.
//
#import "FoodCategoryView.h"
#import "FoodOutlineTableViewCell.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
// 分类隐藏细节，隐私实现的协议🔏
@interface FoodCategoryView() <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *foodCategoryTableView;
@property (nonatomic, strong)UIButton *moreFoodButton;
@property (nonatomic, strong)UILabel *foodCategoryNumbersLabel;
@end

@implementation FoodCategoryView
- (void)viewInit {
    self.backgroundColor = [UIColor whiteColor];
    [self creatTableView];
}
- (void)creatTableView {
    self.foodCategoryTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.foodCategoryTableView.backgroundColor = [UIColor clearColor];
    self.foodCategoryTableView.dataSource = self;
    self.foodCategoryTableView.delegate = self;
    self.foodCategoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.foodCategoryTableView];
    [self.foodCategoryTableView registerClass:[FoodOutlineTableViewCell class] forCellReuseIdentifier:@"foodOutline"];
    [self.foodCategoryTableView registerClass:[UITableViewCell class]
    forCellReuseIdentifier:@"normalLabelCell"];
    [self.foodCategoryTableView registerClass:[UITableViewCell class]
    forCellReuseIdentifier:@"normalButtonCell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 2) {
        return 1;
    } else {
        return [self.foodCateDictionary[@"data"][@"list"] count];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0)  {
        return 40;
    } else if (indexPath.section == 1) {
        return 140;
    } else {
        return 40;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell* normalCell = [self.foodCategoryTableView dequeueReusableCellWithIdentifier:@"normalLabelCell" forIndexPath:indexPath];
        self.foodCategoryNumbersLabel = [[UILabel alloc] init];
        self.foodCategoryNumbersLabel.text = [NSString stringWithFormat:@"搜索到%ld条热门食物", [self.foodCateDictionary[@"data"][@"list"] count]];
        self.foodCategoryNumbersLabel.font = [UIFont systemFontOfSize:13];
        [normalCell addSubview:self.foodCategoryNumbersLabel];
        [self.foodCategoryNumbersLabel mas_makeConstraints:^(MASConstraintMaker* make) {
            make.top.equalTo(@0);
            make.left.equalTo(@15);
            make.width.equalTo(@(ScreenWidth));
            make.bottom.equalTo(@0);
        }];
        return normalCell;
    } else  if (indexPath.section == 1) {
        FoodOutlineTableViewCell *cell = [self.foodCategoryTableView dequeueReusableCellWithIdentifier:@"foodOutline" forIndexPath:indexPath];
        cell.foodNameLabel.text = self.foodCateDictionary[@"data"][@"list"][indexPath.row][@"name"];
        cell.caloryLabel.text = [NSString stringWithFormat:@"%@千卡", self.foodCateDictionary[@"data"][@"list"][indexPath.row][@"calory"]];
        cell.healthLevel.text = [NSString stringWithFormat:@"健康指数：%@", self.foodCateDictionary[@"data"][@"list"][indexPath.row][@"healthLevel"]];
        int runNum = [self.foodCateDictionary[@"data"][@"list"][indexPath.row][@"calory"] intValue];
        cell.runLabel.text = [NSString stringWithFormat:@"大约需要走%d步", runNum * 2];
        return cell;
    } else {
        UITableViewCell* normalCell = [self.foodCategoryTableView dequeueReusableCellWithIdentifier:@"normalButtonCell" forIndexPath:indexPath];
        normalCell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.moreFoodButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.moreFoodButton.layer.masksToBounds = YES;
        self.moreFoodButton.layer.cornerRadius = 14.0;
        [self.moreFoodButton setTitle:@"查询更多食物->" forState:UIControlStateNormal];
        self.moreFoodButton.tintColor = [UIColor blackColor];
        self.moreFoodButton.backgroundColor = [UIColor whiteColor];
        self.moreFoodButton.layer.borderWidth = 1.0;
        self.moreFoodButton.layer.borderColor = [UIColor grayColor].CGColor;
        [self.moreFoodButton addTarget:self action:@selector(pressMoreButton) forControlEvents:UIControlEventTouchUpInside];
        [normalCell addSubview:self.moreFoodButton];
        [self.moreFoodButton mas_makeConstraints:^(MASConstraintMaker* make) {
            make.top.equalTo(@10);
            make.left.equalTo(@(ScreenWidth / 3 + 10));
            make.height.equalTo(@30);
            make.width.equalTo(@120);
        }];
        return normalCell;
    }
    return 0;
}
- (void)pressMoreButton {
    /*注册通知并发送*/
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CategoryToSearchFoodView" object:nil userInfo:nil];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /*注册通知并发送*/
    NSDictionary *foodDetailsIdDictionary = @{@"ID": self.foodCateDictionary[@"data"][@"list"][indexPath.row][@"foodId"]};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CategoryToFoodDetailsView" object:nil userInfo:foodDetailsIdDictionary];
//    NSLog(@"%@", self.foodCateDictionary[@"data"][@"list"][indexPath.row][@"foodId"]);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
