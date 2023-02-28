//
//  SearchFoodView.m
//  HealthSelf
//
//  Created by 李育腾 on 2022/12/21.
//

#import "SearchFoodView.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@implementation SearchFoodView

- (void)viewInit {
    self.keyNameTableView.hidden = YES;
    self.backgroundColor = [UIColor whiteColor];
#pragma mark SearchFoodText
    //查询框
    UIColor *newGray = [UIColor colorWithRed:240 / 255.0f green:240 / 255.0f blue:242 / 255.0f alpha:1.0];
    self.SearchTextFiled = [[UITextField alloc] init];
    self.SearchTextFiled.placeholder = @"搜索食物热量和营养";
    self.SearchTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    self.SearchTextFiled.keyboardType = UIKeyboardTypeURL;
    self.SearchTextFiled.layer.masksToBounds = YES;
    self.SearchTextFiled.layer.cornerRadius = 16.0;
    self.searchImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sousuo-2.png"]];
    self.SearchTextFiled.leftViewMode = UITextFieldViewModeAlways;
    self.SearchTextFiled.leftView = self.searchImageView;
    // textField协议
    self.SearchTextFiled.delegate = self;
    self.SearchTextFiled.backgroundColor = newGray;
    
    [self addSubview: self.SearchTextFiled];
    [self addSubview: self.searchImageView];
    [self.SearchTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@25);
        make.height.equalTo(@35);
        make.width.equalTo(@(ScreenWidth - 90));
        make.top.equalTo(@100);
    }];
    [self.searchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@21);
        make.width.equalTo(@21);
    }];
    
    UIColor *buttonColor = [UIColor colorWithRed:105 / 255.0f green:183 / 255.0f blue:135 / 255.0f alpha:1.0];
    self.exitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.exitButton.tag = 1;
    self.exitButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    self.exitButton.tintColor = buttonColor;
    [self.exitButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.exitButton addTarget:self action:@selector(pressExit:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.exitButton];
    [self.exitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo([self.SearchTextFiled mas_right]).offset(1);
        make.top.equalTo(@88);
        make.width.equalTo(@70);
        make.height.equalTo(@50);
    }];
    
  
    self.usersLabel= [[UILabel alloc] init];
    self.usersLabel.text = @"大家都在搜";
    self.usersLabel.textColor = [UIColor blackColor];
    self.usersLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:19];
    [self addSubview:self.usersLabel];
    [self.usersLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.SearchTextFiled mas_bottom]).offset(30);
        make.left.equalTo([self.SearchTextFiled mas_left]).offset(-1);
        make.width.equalTo(@120);
        make.height.equalTo(@40);
    }];
    self.majoritySearchFoodArray = @[@"米饭", @"鸡蛋", @"牛奶", @"玉米", @"苹果", @"红薯", @"香蕉"];
    
    for (int i = 0; i < 7; i++) {
        self.majorySearchFoodButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.majorySearchFoodButton.layer.masksToBounds = YES;
        self.majorySearchFoodButton.layer.cornerRadius = 15.0;
        self.majorySearchFoodButton.backgroundColor = newGray;
        self.majorySearchFoodButton.tintColor = [UIColor blackColor];
        [self.majorySearchFoodButton setTitle:self.majoritySearchFoodArray[i] forState:UIControlStateNormal];
        [self.majorySearchFoodButton addTarget:self action:@selector(pressExit:) forControlEvents:UIControlEventTouchUpInside];
        self.majorySearchFoodButton.tag = 100 + i;
        [self addSubview:self.majorySearchFoodButton];
        if (self.majorySearchFoodButton.tag < 104) {
            [self.majorySearchFoodButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([self.usersLabel mas_bottom]).offset(20);
                make.left.equalTo([self.usersLabel mas_left]).offset(2 + i * 80);
                make.width.equalTo(@60);
                make.height.equalTo(@30);
            }];
        } else {
            [self.majorySearchFoodButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([self.usersLabel mas_bottom]).offset(70);
                make.left.equalTo([self.usersLabel mas_left]).offset(2 + (i - 4) * 80);
                make.width.equalTo(@60);
                make.height.equalTo(@30);
            }];
        }
    }
    [self creatTableView];
}
- (void)pressExit:(UIButton *)button {
    [self.ExitDelegate returnButton:button];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSDictionary *keyNameDictionary = @{@"keyName":self.SearchTextFiled.text};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"keyNameFood" object:nil userInfo:keyNameDictionary];
    return YES;
}
- (void)creatTableView {
    self.keyNameTableView = [[UITableView alloc] init];
    self.keyNameTableView.delegate = self;
    self.keyNameTableView.dataSource = self;
    [self addSubview:self.keyNameTableView];
    [self.keyNameTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self.SearchTextFiled mas_bottom]).offset(2);
        make.left.equalTo([self.SearchTextFiled mas_left]).offset(0);
        make.width.equalTo([self.SearchTextFiled mas_width]);
        make.height.equalTo(@(ScreenHeight / 2 - 20));
    }];
    self.keyNameTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.keyNameTableView.backgroundColor = [UIColor whiteColor];
    [self.keyNameTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"keyFoodName"];
    UIView *keyNameFooterView = [[UIView alloc] init];
    self.keyNameTableView.tableFooterView = keyNameFooterView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"keyFoodName" forIndexPath:indexPath];
    while ([cell.contentView.subviews lastObject] != nil) {
        [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
    }
    cell.textLabel.text = self.keyFoodNameArray[indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.keyFoodNameArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 38;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    //准备开始输入
    self.keyNameTableView.hidden = NO;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //回收键盘对象
    //隐藏TableView
    [self.SearchTextFiled resignFirstResponder];;
    self.keyNameTableView.hidden = YES;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // https://www.mxnzp.com/api/food_heat/food/details?foodId=d2bd36c5754e36c4&page=1&app_id=icwnrnfenlpvforw&app_secret=N1BEY0R5ZkVMM1B0b2t6R3F6YkVzZz09
    //
    [self.foodDetailsDelegate returnFoodName:self.keyFoodIdArray[indexPath.row]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
  #pragma  mark - textField delegate
 - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
 {
     NSLog(@"1");//输入文字时 一直监听
     return YES;
 }
 -(void)textFieldDidBeginEditing:(UITextField *)textField
 {
     NSLog(@"2");// 准备开始输入  文本字段将成为第一响应者
 }
 -(void)textFieldDidEndEditing:(UITextField *)textField
 {
     NSLog(@"3");//文本彻底结束编辑时调用
 }
 -(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
 {
     NSLog(@"4");//返回一个BOOL值，指定是否循序文本字段开始编辑
     return YES;
 }
 -(BOOL)textFieldShouldClear:(UITextField *)textField
 {
     NSLog(@"5");// 点击‘x’清除按钮时 调用
     return YES;
 }
 -(BOOL)textFieldShouldEndEditing:(UITextField *)textField
 {
     NSLog(@"6");//返回BOOL值，指定是否允许文本字段结束编辑，当编辑结束，文本字段会让出第一响应者
     return YES;
 }
 -(BOOL)textFieldShouldReturn:(UITextField *)textField
 {
     NSLog(@"7");// 点击键盘的‘换行’会调用
     return YES;
 }
*/

@end
