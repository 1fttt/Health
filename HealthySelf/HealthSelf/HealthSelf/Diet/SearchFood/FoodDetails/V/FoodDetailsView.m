//
//  FoodDetailsView.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/29.
//

#import "FoodDetailsView.h"
#import <Masonry.h>
#import "FoodFirstTableViewCell.h"
#import "FoodSecondTableViewCell.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@implementation FoodDetailsView
- (void)initView {
    UIColor *newBackGroundGray = [UIColor colorWithRed:246 / 255.0f green: 247 / 255.0f blue: 250 / 255.0f alpha:1.0];
    self.backgroundColor = newBackGroundGray;
    [self creatTableView];
}
- (void)creatTableView {
    self.foodDetailsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, ScreenWidth, ScreenHeight)];
    self.foodDetailsTableView.dataSource = self;
    self.foodDetailsTableView.delegate = self;
    [self addSubview:self.foodDetailsTableView];
    self.foodDetailsTableView.backgroundColor = [UIColor clearColor];
    [self.foodDetailsTableView registerClass:[FoodFirstTableViewCell class] forCellReuseIdentifier:@"foodFirst"];
    [self.foodDetailsTableView registerClass:[FoodSecondTableViewCell class] forCellReuseIdentifier:@"foodSecond"];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0)  {
        return ScreenHeight / 3 - 50;
    } else {
        return ScreenHeight - 70;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        FoodFirstTableViewCell *cell = [[FoodFirstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"foodFirst"];
        if ([self.foodDetailsDiciionary[@"data"][@"healthTips"] isEqualToString:@"绿灯食物"]) {
            cell.foodColorView.backgroundColor = [UIColor greenColor];
        } else if ([self.foodDetailsDiciionary[@"data"][@"healthTips"] isEqualToString:@"红灯食物"]) {
            cell.foodColorView.backgroundColor = [UIColor redColor];
        } else {
            cell.foodColorView.backgroundColor = [UIColor orangeColor];
        }
        cell.foodNameLabel.text = self.foodDetailsDiciionary[@"data"][@"name"];
        cell.caloryLabel.text = [NSString stringWithFormat:@"%@千卡", self.foodDetailsDiciionary[@"data"][@"calory"]];
        cell.jouleLabel.text = [NSString stringWithFormat:@"%@千焦", self.foodDetailsDiciionary[@"data"][@"joule"]];
        cell.recommendLabel.text = [NSString stringWithFormat:@"%@: %@", self.foodDetailsDiciionary[@"data"][@"healthTips"], self.foodDetailsDiciionary[@"data"][@"healthSuggest"]];
        return cell;
    } else {
        FoodSecondTableViewCell *cell = [[FoodSecondTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"foodSecond"];
        cell.bigJoueleLabel.text = [NSString stringWithFormat:@"%@", self.foodDetailsDiciionary[@"data"][@"calory"]];
        int runNum = [self.foodDetailsDiciionary[@"data"][@"calory"] intValue];
        cell.runLabel.text = [NSString stringWithFormat:@"大约需要走%d步", runNum * 2];
        if ([self.foodDetailsDiciionary[@"data"][@"glycemicInfoData"][@"gi"][@"value"] isEqualToString:@""]) {
            cell.giLabel.text = [NSString stringWithFormat:@"升糖指数:--"];
            cell.glLabel.text = [NSString stringWithFormat:@"升糖负荷:--"];
        } else {
            cell.giLabel.text = [NSString stringWithFormat:@"升糖指数:%@ %@", self.foodDetailsDiciionary[@"data"][@"glycemicInfoData"][@"gi"][@"value"], self.foodDetailsDiciionary[@"data"][@"glycemicInfoData"][@"gi"][@"label"]];
            cell.glLabel.text = [NSString stringWithFormat:@"升糖负荷:%@ %@", self.foodDetailsDiciionary[@"data"][@"glycemicInfoData"][@"gl"][@"value"], self.foodDetailsDiciionary[@"data"][@"glycemicInfoData"][@"gl"][@"label"]];
        }
        cell.proteinLabel.text = [NSString stringWithFormat:@"%@%@", self.foodDetailsDiciionary[@"data"][@"protein"], self.foodDetailsDiciionary[@"data"][@"proteinUnit"]];
        cell.fatLabel.text = [NSString stringWithFormat:@"%@%@", self.foodDetailsDiciionary[@"data"][@"fat"], self.foodDetailsDiciionary[@"data"][@"fatUnit"]];
        cell.carbohydrateLabel.text = [NSString stringWithFormat:@"%@%@", self.foodDetailsDiciionary[@"data"][@"carbohydrate"], self.foodDetailsDiciionary[@"data"][@"carbohydrateUnit"]];
        cell.natriumLabel.text = [NSString stringWithFormat:@"%@%@", self.foodDetailsDiciionary[@"data"][@"natrium"], self.foodDetailsDiciionary[@"data"][@"natriumUnit"]];
        cell.fiberDietaryLabel.text = [NSString stringWithFormat:@"%@%@", self.foodDetailsDiciionary[@"data"][@"fiberDietary"], self.foodDetailsDiciionary[@"data"][@"fiberDietaryUnit"]];
        
        
        return cell;
    }
    return 0;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
