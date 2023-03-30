//
//  MenuView.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/11.
//

#import "MenuView.h"
#import "MenuListTableViewCell.h"
#import "UIImageView+WebCache.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface MenuView ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *recipesTableView;
@property (nonatomic, strong)UIButton *moreFoodButton;
@property (nonatomic, strong)UILabel *foodCategoryNumbersLabel;
@end
@implementation MenuView
- (void)viewInit {
    self.backgroundColor = [UIColor whiteColor];
//    NSLog(@"%@", self.menuListDictionary);
    [self creatTableView];
}
- (void)creatTableView {
    self.recipesTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.recipesTableView.backgroundColor = [UIColor clearColor];
    self.recipesTableView.dataSource = self;
    self.recipesTableView.delegate = self;
    self.recipesTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.recipesTableView];
    // 自适应撑开cell?
//    self.recipesTableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.recipesTableView registerClass:[MenuListTableViewCell class] forCellReuseIdentifier:@"menuListCell"];
    [self.recipesTableView registerClass:[UITableViewCell class]
    forCellReuseIdentifier:@"normalLabelCell"];
    [self.recipesTableView registerClass:[UITableViewCell class]
    forCellReuseIdentifier:@"normalButtonCell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 2) {
        return 1;
    } else {
        if ([self.menuListDictionary[@"result"][@"result"][@"list"] count] != 0) {
            return [self.menuListDictionary[@"result"][@"result"][@"list"] count];
        } else {
            [self failedMenu];
        }
        return 0;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0)  {
        return 40;
    } else if (indexPath.section == 1) {
        return 350;
    } else {
        return 40;
    }
    return 0;
}
/**
 sjkfafg a while daf sfgfbangafa fafjk whie while
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell* normalCell = [self.recipesTableView dequeueReusableCellWithIdentifier:@"normalLabelCell" forIndexPath:indexPath];
        self.foodCategoryNumbersLabel = [[UILabel alloc] init];
        self.foodCategoryNumbersLabel.text = [NSString stringWithFormat:@"推荐%ld个菜谱  健康好生活 做饭多选择", [self.menuListDictionary[@"result"][@"result"][@"list"] count]];
        self.foodCategoryNumbersLabel.font = [UIFont systemFontOfSize:15];
        [normalCell addSubview:self.foodCategoryNumbersLabel];
        [self.foodCategoryNumbersLabel mas_makeConstraints:^(MASConstraintMaker* make) {
            make.top.equalTo(@0);
            make.left.equalTo(@12);
            make.width.equalTo(@(ScreenWidth));
            make.bottom.equalTo(@0);
        }];
        return normalCell;
    } else if (indexPath.section == 1) {
        
        MenuListTableViewCell *listCell = [self.recipesTableView dequeueReusableCellWithIdentifier:@"menuListCell" forIndexPath:indexPath];
        NSString* imageName = [NSString stringWithFormat:@"%@", self.menuListDictionary[@"result"][@"result"][@"list"][indexPath.row][@"pic"]];
        NSURL* urlImage = [NSURL URLWithString:imageName];
        [listCell.foodImageView sd_setImageWithURL:urlImage];
        
        listCell.foodNameLabel.text = [NSString stringWithFormat:@"%@", self.menuListDictionary[@"result"][@"result"][@"list"][indexPath.row][@"name"]];
        listCell.peopelNumLabel.text = [NSString stringWithFormat:@"%@", self.menuListDictionary[@"result"][@"result"][@"list"][indexPath.row][@"peoplenum"]];
        listCell.cookingtimeLabel.text = [NSString stringWithFormat:@"%@", self.menuListDictionary[@"result"][@"result"][@"list"][indexPath.row][@"cookingtime"]];
        listCell.tagLabel.text = [NSString stringWithFormat:@"%@", self.menuListDictionary[@"result"][@"result"][@"list"][indexPath.row][@"tag"]];
        listCell.contenLabel.text = [NSString stringWithFormat:@"%@", self.menuListDictionary[@"result"][@"result"][@"list"][indexPath.row][@"content"]];
        listCell.stepButton.tag = 222;
        // 在自定义cell里将button添加到contenview才能实现点击事件，查看图层问题得知
//        [listCell.stepButton addTarget:self action:@selector(pressMoreButton:) forControlEvents:UIControlEventTouchUpInside];
        return listCell;
    } else {
        UITableViewCell* normalCell = [self.recipesTableView dequeueReusableCellWithIdentifier:@"normalButtonCell" forIndexPath:indexPath];
        normalCell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.moreFoodButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.moreFoodButton.layer.masksToBounds = YES;
        self.moreFoodButton.layer.cornerRadius = 14.0;
        [self.moreFoodButton setTitle:@"查询更多食物->" forState:UIControlStateNormal];
        self.moreFoodButton.tintColor = [UIColor blackColor];
        self.moreFoodButton.backgroundColor = [UIColor whiteColor];
        self.moreFoodButton.layer.borderWidth = 1.0;
        self.moreFoodButton.layer.borderColor = [UIColor grayColor].CGColor;
        self.moreFoodButton.tag = 111;
        [self.moreFoodButton addTarget:self action:@selector(pressMoreButton:) forControlEvents:UIControlEventTouchUpInside];
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *row = [NSString stringWithFormat:@"%ld", indexPath.row];
    NSDictionary *cellRowDictionary = @{@"cellRowOfIndexPath": row};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ToMenuStepView" object:nil userInfo:cellRowDictionary];
}
#pragma mark -菜单失败
- (void)failedMenu {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"failedMenu" object:nil userInfo:nil];
}
- (void)pressMoreButton:(UIButton *)button {
    NSLog(@"你忘写自己的方法了");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
