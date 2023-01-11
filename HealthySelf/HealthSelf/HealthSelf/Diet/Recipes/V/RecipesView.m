//
//  RecipesView.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/5.
//

#import "RecipesView.h"
#import "FoodRecipesTableViewCell.h"
#import "UIImageView+WebCache.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface RecipesView ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *recipesTableView;
@property (nonatomic, strong)NSArray *iconArray;
@end
@implementation RecipesView
- (void)viewInit {
    self.backgroundColor = [UIColor whiteColor];
    self.iconArray = @[@"zhushi.png", @"roudan.png", @"dadou.png", @"shucai.png", @"fruit.png", @"niunai.png", @"jianguo.png", @"youzhi.png", @"xiangliao.png", @"yinliao.png", @"lengyin.png", @"zhushi.png"];
    [self creatTableView];
    
}
- (void)creatTableView {
    self.recipesTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.recipesTableView.backgroundColor = [UIColor clearColor];
    self.recipesTableView.dataSource = self;
    self.recipesTableView.delegate = self;
    self.recipesTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.recipesTableView];
    [self.recipesTableView registerClass:[FoodRecipesTableViewCell class] forCellReuseIdentifier:@"foodRecipes"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.recipesDiciionary [@"data"]count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  140;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FoodRecipesTableViewCell *recipesCell = [self.recipesTableView dequeueReusableCellWithIdentifier:@"foodRecipes" forIndexPath:indexPath];
    recipesCell.labelTitle.text = self.recipesDiciionary[@"data"][indexPath.row][@"name"];
    // 获取图片
    NSString *imageName = [NSString stringWithFormat:@"%@", self.iconArray[indexPath.row]];
    recipesCell.imageViewMy = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    recipesCell.imageViewMy.frame = CGRectMake(ScreenWidth / 4 * 3, 20, 85, 85);
    [recipesCell addSubview:recipesCell.imageViewMy];
    return recipesCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /*注册通知并发送*/
    NSDictionary *idDictionary = @{@"foodId": self.recipesDiciionary[@"data"][indexPath.row][@"id"]};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RecipesToFoodCategoryView" object:nil userInfo:idDictionary];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
