//
//  SetTableViewCell.m
//  HealthSelf
//
//  Created by 张佳慧 on 2022/12/18.
//

#import "SetTableViewCell.h"
#import "Masonry.h"
@implementation SetTableViewCell

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
    if ([self.reuseIdentifier isEqualToString:@"first"]) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:19];
        [self.contentView addSubview:_label];
        
        _smallView = [[UIImageView alloc] init];
        _smallView.image = [UIImage imageNamed:@"_xiangyou2.png"];
        [self.contentView addSubview:_smallView];

    }
    [self layoutSubviews];
    return self;
}
-(void)layoutSubviews {
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.top.mas_equalTo(8);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    
    [_smallView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(340);
        make.top.mas_equalTo(17);
        make.width.mas_equalTo(35);
        make.height.mas_equalTo(35);
    }];
}
@end
