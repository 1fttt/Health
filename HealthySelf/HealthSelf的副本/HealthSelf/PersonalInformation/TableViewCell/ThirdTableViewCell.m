//
//  ThirdTableViewCell.m
//  HealthSelf
//
//  Created by 张佳慧 on 2022/12/17.
//

#import "ThirdTableViewCell.h"
#import "Masonry.h"
@implementation ThirdTableViewCell

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
    if ([self.reuseIdentifier isEqualToString:@"third"]) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:19];
        [self.contentView addSubview:_label];
        
        _smallView = [[UIImageView alloc] init];
        _smallView.image = [UIImage imageNamed:@"_xiangyou2.png"];
        [self.contentView addSubview:_smallView];
        
        _labelImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_labelImageView];
    }
    [self layoutSubviews];
    return self;
}
-(void)layoutSubviews {
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.top.mas_equalTo(12);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    
    [_smallView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(340);
        make.top.mas_equalTo(17);
        make.width.mas_equalTo(35);
        make.height.mas_equalTo(35);
    }];
    
    [_labelImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(22);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
}
@end
