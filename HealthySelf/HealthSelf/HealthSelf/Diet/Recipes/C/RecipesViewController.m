//
//  RecipesViewController.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/5.
//

#import "RecipesViewController.h"
#import "RecipesView.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface RecipesViewController ()
@property (nonatomic, strong)RecipesView *recipesView;
@end

@implementation RecipesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.recipesView = [[RecipesView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.recipesView];
    [self titleSet];
    self.recipesView.recipesDiciionary = self.recipesDiciionary;
    [self.recipesView viewInit];
}
- (void)titleSet {
    self.title = @"食谱分类";
    UIBarButtonItem* leftBtn2 = [[UIBarButtonItem alloc]initWithTitle:@"< Diet" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    leftBtn2.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = leftBtn2;
}
- (void)pressLeft {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
