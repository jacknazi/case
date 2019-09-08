//
//  MyTableViewCell.m
//  tableview
//
//  Created by linwei on 2019/9/8.
//  Copyright © 2019 bytedance. All rights reserved.
//

#import "MyTableViewCell.h"
#import "Model.h"
@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(Model *)model{
    self->_model = model;
    self.detailTextLabel.text = [NSString stringWithFormat:@"下载量:%@",model.download];
    self.textLabel.text = model.name;
    self.detailTextLabel.hidden = NO;
    self.imageView.image = [UIImage imageNamed:@"001.jpg"];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
}

@end
