//
//  MyCollectionViewCell.m
//  collectionview
//
//  Created by linwei on 2019/9/8.
//  Copyright © 2019 bytedance. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "Model.h"
@interface MyCollectionViewCell()
@property (strong,nonatomic) UIImageView *imageview;
@property (strong,nonatomic) UILabel *Download;
@property (strong,nonatomic) UILabel *name;
@end
@implementation MyCollectionViewCell
- (void)setModel:(Model *)model{
    self->_model = model;
    CGFloat width = [self bounds].size.width;
    CGFloat height = 30;
//    self.button.frame = CGRectMake(0, 0, width, width);
////    NSURL *url = [NSURL URLWithString:model.icon];
////    NSData *data = [NSData dataWithContentsOfURL:url];
////    UIImage *img = [UIImage imageWithData:data];
//    [self.button setBackgroundImage:[UIImage imageNamed:@"001.jpg"] forState:UIControlStateNormal];
    self.imageview.image = [UIImage imageNamed:@"001.jpg"];
    self.name.text = [NSString stringWithFormat:@"%@",model.name];
    self.Download.text = [NSString stringWithFormat:@"下载量:%@",model.Download];
    self.name.frame = CGRectMake(0, width-height, width, height);
    self.Download.frame = CGRectMake(0, width-2*height, width, height);
    self.imageview.frame =  CGRectMake(0, 0, width, width);
   // [self.contentView addSubview:self.button];
    self.backgroundView = self.imageview;
    [self.contentView addSubview:self.Download];
    [self.contentView addSubview:self.name];
}
- (id)initWithFrame:(CGRect)frame{
    if(self == [super initWithFrame:frame]){
        self.imageview = [[UIImageView alloc] init];
        self.Download = [[UILabel alloc] init];
        self.name = [[UILabel alloc] init];
    }
    return self;
}
@end
