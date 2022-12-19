//
//  FirstTableViewCell.m
//  HealthSelf
//
//  Created by 张佳慧 on 2022/12/17.
//

#import "FirstTableViewCell.h"
#import "Masonry.h"
@implementation FirstTableViewCell

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
        _avatarsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _avatarsButton.backgroundColor = [UIColor redColor];
        [_avatarsButton setImage:[UIImage imageNamed:@"touxiang.JPG"] forState:UIControlStateNormal];
        _avatarsButton.layer.masksToBounds = YES;
        _avatarsButton.layer.cornerRadius = 30;
        [self.contentView addSubview:_avatarsButton];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"hhhhhhhhhh";
        _nameLabel.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_nameLabel];
        
        _personalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_personalButton setTitle:@"个人主页" forState:UIControlStateNormal];
        [_personalButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.contentView addSubview:_personalButton];
    }
    return self;
}
-(void)layoutSubviews {
    [_avatarsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(60);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(90);
        make.top.mas_equalTo(20);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    
    [_personalButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(280);
        make.top.mas_equalTo(30);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
}
@end
