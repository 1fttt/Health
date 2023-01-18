//
//  MenuDetailsView.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/12.
//

#import "MenuDetailsView.h"
#import "MaterialTableViewCell.h"
#import "MenuStepsTableViewCell.h"
#import <Masonry.h>
#import "UIImageView+WebCache.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface MenuDetailsView()<UITableViewDelegate, UITableViewDataSource>
//materials
@property (nonatomic, strong)UITableView *menuDetailsTableView;
@property (nonatomic, strong)UILabel *materialsLabel;
@property (nonatomic, strong)UILabel *amountLabel;
@property (nonatomic, strong)UIView *materialLineView;
//steps
@property (nonatomic, strong)UIImageView *stepImageView;
@property (nonatomic, strong)UILabel *stepLabel;
@end
@implementation MenuDetailsView
- (void)viewInit {
    UIColor *newBackGroundGray = [UIColor colorWithRed:246 / 255.0f green: 247 / 255.0f blue: 250 / 255.0f alpha:1.0];
    self.backgroundColor = newBackGroundGray;
    [self creatTableView];
}
- (void)creatTableView {
    self.menuDetailsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, ScreenWidth, ScreenHeight)];
    self.menuDetailsTableView.dataSource = self;
    self.menuDetailsTableView.delegate = self;
    [self addSubview:self.menuDetailsTableView];
    self.menuDetailsTableView.backgroundColor = [UIColor clearColor];
    [self.menuDetailsTableView registerClass:[MaterialTableViewCell class] forCellReuseIdentifier:@"materialCell"];
    [self.menuDetailsTableView registerClass:[MenuStepsTableViewCell class] forCellReuseIdentifier:@"menuStepsCell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0)  {
        return (140 + 40 * [self.menuMaterialDiciionary[@"material"] count]);
    } else {
        return (140 + 110 * [self.menuMaterialDiciionary[@"process"] count]);
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MaterialTableViewCell *materialCell = [self.menuDetailsTableView dequeueReusableCellWithIdentifier:@"materialCell" forIndexPath:indexPath];
        // 名称
        materialCell.menuNameLabel.text = self.menuMaterialDiciionary[@"name"];
        // Image
        NSString* imageName = [NSString stringWithFormat:@"%@", self.menuMaterialDiciionary[@"pic"]];
        NSURL* urlImage = [NSURL URLWithString:imageName];
        [materialCell.menuImageView sd_setImageWithURL:urlImage];
        
        // 清单
        UIColor *menuLineViewColor = [UIColor colorWithRed: 248 / 255.0f green:248 / 255.0f blue:248 / 255.0f alpha:1.0];
        for (int i = 0; i < [self.menuMaterialDiciionary[@"material"] count]; i++) {
            self.materialsLabel = [[UILabel alloc] init];
            self.materialsLabel.text = self.menuMaterialDiciionary[@"material"][i][@"mname"];
            self.materialsLabel.font = [UIFont systemFontOfSize:15];
            
            self.amountLabel = [[UILabel alloc] init];
            self.amountLabel.text = self.menuMaterialDiciionary[@"material"][i][@"amount"];
            self.amountLabel.font = [UIFont systemFontOfSize:15];
            
            self.materialLineView = [[UIView alloc] init];
            self.materialLineView.backgroundColor = menuLineViewColor;
            
            [materialCell.backView addSubview:self.materialsLabel];
            [materialCell.backView addSubview:self.amountLabel];
            [materialCell.backView addSubview:self.materialLineView];
            
            [self.materialsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([materialCell.materialsTitleLabel mas_bottom]).offset(i * 40 + 15);
                make.left.equalTo([materialCell.materialsTitleLabel mas_left]).offset(8);
            }];
            [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([materialCell.materialsTitleLabel mas_bottom]).offset(i * 40 + 15);
                make.right.equalTo(@-25);
            }];
            [self.materialLineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([self.materialsLabel mas_bottom]).offset(8);
                make.height.equalTo(@1.5);
                make.left.equalTo(@8);
                make.width.equalTo(@(ScreenWidth - 76));
            }];
            
        }
        return materialCell;
    } else if (indexPath.section == 1) {
        MenuStepsTableViewCell *stepCell = [self.menuDetailsTableView dequeueReusableCellWithIdentifier:@"menuStepsCell" forIndexPath:indexPath];
        UIColor *menuLineViewColor = [UIColor colorWithRed: 248 / 255.0f green:248 / 255.0f blue:248 / 255.0f alpha:1.0];
        for (int i = 0; i < [self.menuMaterialDiciionary[@"process"] count]; i++) {
            self.stepLabel = [[UILabel alloc] init];
            self.stepLabel.numberOfLines = 4;
            self.stepLabel.font = [UIFont systemFontOfSize:13];
            self.stepLabel.text = self.menuMaterialDiciionary[@"process"][i][@"pcontent"];
            
            self.stepImageView = [[UIImageView alloc] init];
            self.stepImageView.layer.borderWidth = 0.1;
            self.stepImageView.layer.borderColor = [UIColor grayColor].CGColor;
            self.stepImageView.layer.masksToBounds = YES;
            self.stepImageView.layer.cornerRadius = 16;
            NSString* imageName = [NSString stringWithFormat:@"%@", self.menuMaterialDiciionary[@"process"][i][@"pic"]];
            NSURL* urlImage = [NSURL URLWithString:imageName];
            [self.stepImageView sd_setImageWithURL:urlImage];
            
            self.materialLineView = [[UIView alloc] init];
            self.materialLineView.backgroundColor = menuLineViewColor;
            
            [stepCell.backView addSubview:self.stepLabel];
            [stepCell.backView addSubview:self.stepImageView];
            [stepCell.backView addSubview:self.materialLineView];
            
            [self.stepLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([stepCell.cookingtimeLabel mas_bottom]).offset(20 + 105 * i);
                make.left.equalTo([stepCell.cookingtimeLabel mas_left]).offset(2);
                make.width.equalTo(@(ScreenWidth / 3));
            }];
            [self.stepImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([stepCell.cookingtimeLabel mas_bottom]).offset(15 + 105 * i);
                make.right.equalTo(@-20);
                make.width.equalTo(@70);
                make.height.equalTo(@70);
            }];
            [self.materialLineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([self.stepImageView mas_bottom]).offset(15);
                make.height.equalTo(@1.5);
                make.left.equalTo(@8);
                make.width.equalTo(@(ScreenWidth - 76));
            }];
            
        }
        return stepCell;
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
