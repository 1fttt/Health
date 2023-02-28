//
//  FoodRecipesTableViewCell.m
//  HealthSelf
//
//  Created by 李育腾 on 2023/1/8.
//

#import "FoodRecipesTableViewCell.h"
#import <Masonry.h>
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@implementation FoodRecipesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _labelTitle = [[UILabel alloc] init];
        _labelTitle.font = [UIFont systemFontOfSize:18];
        _labelTitle.numberOfLines = 0;
        _labelTitle.text = @"小事-外婆的江湖关于小司先安慰版";
        [self addSubview:_labelTitle];
        
        _labelSmall = [[UILabel alloc] init];
        _labelSmall.font = [UIFont systemFontOfSize:13];
        _labelSmall.text = @"VOL.1445";
        _labelSmall.numberOfLines = 0;
        _labelSmall.textColor = [UIColor grayColor];
        [self addSubview:_labelSmall];
    }
    return self;
}
- (void)layoutSubviews {
    
    [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(20);
        make.left.equalTo(self).offset(12);
        make.width.equalTo(@(ScreenWidth / 4 * 3));
        make.height.equalTo(@60);
    }];
    [_labelSmall mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(85);
        make.left.equalTo(self).offset(12);
        make.width.equalTo(@(ScreenWidth / 4 * 3));
        make.height.equalTo(@20);
    }];
    
}
@end
