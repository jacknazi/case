//
//  model.m
//  collectionview
//
//  Created by linwei on 2019/9/8.
//  Copyright © 2019 bytedance. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self == [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)modelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
