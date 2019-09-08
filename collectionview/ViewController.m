//
//  ViewController.m
//  collectionview
//
//  Created by linwei on 2019/9/8.
//  Copyright © 2019 bytedance. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "MyCollectionViewCell.h"
#import <MJRefresh/MJRefresh.h>
#define mainWidth [[UIScreen mainScreen] bounds].size.width
#define mainHeight [[UIScreen mainScreen] bounds].size.height
#define statusBarWeight [[UIApplication sharedApplication] statusBarFrame].size.height
@interface ViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;
@property (strong,nonatomic) NSMutableArray *apps;
@end

@implementation ViewController
- (NSArray *)apps{
    if(_apps == nil){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSString *path = [[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
            NSArray *arr = [NSArray arrayWithContentsOfFile:path];
            NSMutableArray *models = [[NSMutableArray alloc] init];
            for(NSDictionary *dict in arr){
                Model *model = [Model modelWithDict:dict];
                [models addObject:model];
            }
            self->_apps = models;
        });
    }
    return _apps;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionview.dataSource = self;
    self.collectionview.delegate = self;
    self.collectionview.frame = CGRectMake(0,statusBarWeight,mainWidth, mainHeight-statusBarWeight);
   // self.collectionview.backgroundColor = [UIColor blackColor];
    [self.collectionview registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"collectionview"];
    self.collectionview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        NSInteger len = self.apps.count;
        for(int i = 0; i < len; i++){
            [self.apps addObject:self.apps[i]];
        }
       // sleep(5);
        [self.collectionview reloadData];
        [self.collectionview.mj_footer endRefreshing];
    }];
    
    self.collectionview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSInteger len = self.apps.count;
        for(int i = 0; i < len/2; i++){
            [self.apps removeObject:[self.apps lastObject]];
        }
        sleep(5);
        [self.collectionview reloadData];
        [self.collectionview.mj_header endRefreshing];
    }];
    // Do any additional setup after loading the view.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.apps.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(mainWidth/2, mainWidth/2);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = [self.collectionview dequeueReusableCellWithReuseIdentifier:@"collectionview" forIndexPath:indexPath];
    cell.model = self.apps[indexPath.row];
    return cell;
}
@end
