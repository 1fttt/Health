//
//  SecondTableViewCell.m
//  HealthSelf
//
//  Created by 张佳慧 on 2022/12/17.
//

#import "SecondTableViewCell.h"
#import "Masonry.h"
@implementation SecondTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"second"]) {
        NSArray* textArray = [NSArray arrayWithObjects:@"订单",@"购物车",@"我的收藏",@"我的食物",@"基本信息",@"薄荷花田",@"智能设备",@"兑换",nil];
        for (int i = 0; i < 8; i++)
            {
                int a = i/4;  
                int b = i%4;
                UILabel* label = [[UILabel alloc] init];
                label.text = textArray[i];
                label.font = [UIFont systemFontOfSize:12];
                label.textAlignment = NSTextAlignmentCenter;
                [self.contentView addSubview:label];
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(5+100*b);
                    make.top.mas_equalTo(40+a*70);
                    make.width.mas_equalTo(100);
                    make.height.mas_equalTo(50);
                }];
            }
        
        NSArray* array = [NSArray arrayWithObjects:@"dingdan.png",@"gouwuche.png",@"shoucang.png",@"shipu.png",@"xinxi.png",@"huahua.png",@"shebei.png",@"duihuan.png", nil];
        for (int i = 0; i < 8; i++)
            {
                int a = i/4;
                int b = i%4;
                UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.tag = i;
                [button setImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
                [self.contentView addSubview:button];
                
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(30+100*b);
                    make.top.mas_equalTo(10+a*70);
                    make.width.mas_equalTo(50);
                    make.height.mas_equalTo(50);
                }];
            }
    }
    
    return self;
}


@end
