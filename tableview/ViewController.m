//
//  ViewController.m
//  tableview
//
//  Copyright © 2019 bytedance. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "MyTableViewCell.h"
#import <MJRefresh/MJRefresh.h>
#define mainWidth [[UIScreen mainScreen] bounds].size.width
#define mainHeight [[UIScreen mainScreen] bounds].size.height
#define statusBarWeight [[UIApplication sharedApplication] statusBarFrame].size.height
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *MyTableView;
@property (strong ,nonatomic) NSMutableArray *apps;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.MyTableView.dataSource = self;
    self.MyTableView.delegate = self;
  //  [self.MyTableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"tableview"];
    self.MyTableView.frame = CGRectMake(0,statusBarWeight,mainWidth, mainHeight-statusBarWeight);
    self.MyTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        NSInteger len = self.apps.count;
        for(int i = 0; i < len; i++){
            [self.apps addObject:self.apps[i]];
        }
        sleep(5);
        [self.MyTableView reloadData];
        [self.MyTableView.mj_footer endRefreshing];
    }];
    
    self.MyTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSInteger len = self.apps.count;
        for(int i = 0; i < len/2; i++){
            [self.apps removeObject:[self.apps lastObject]];
        }
        [self.MyTableView reloadData];
        [self.MyTableView.mj_header endRefreshing];
    }];
}
- (NSMutableArray *)apps{
    if(_apps == nil){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            self->_apps = [[NSMutableArray alloc] init];
            NSString *path = [[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
            NSArray *arr = [NSArray arrayWithContentsOfFile:path];
            for(NSDictionary *dict in arr){
                Model *model = [Model modelWithDict:dict];
                [self->_apps addObject:model];
            }
        });
    }
    return _apps;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.apps.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"tableview";
    MyTableViewCell *cell = [self.MyTableView dequeueReusableCellWithIdentifier:str];
    if(cell == nil){
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    cell.model = self.apps[indexPath.row];
    return cell;
}
@end
