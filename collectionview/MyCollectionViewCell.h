//
//  MyCollectionViewCell.h
//  collectionview
//
//  Created by linwei on 2019/9/8.
//  Copyright © 2019 bytedance. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class Model;
@interface MyCollectionViewCell : UICollectionViewCell
@property (strong,nonatomic) Model *model;
@end

NS_ASSUME_NONNULL_END
