//
//  model.h
//  collectionview
//
//  Created by linwei on 2019/9/8.
//  Copyright © 2019 bytedance. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *Download;
@property (nonatomic,copy) NSString *name;
+ (instancetype)modelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
