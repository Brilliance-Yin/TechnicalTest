//
//  CityViewController.m
//  TechnicalTest
//
//  Created by Watson on 2018/1/4.
//  Copyright © 2018年 github. All rights reserved.
//

#import "CityViewController.h"
#import "CItyGuideCell.h"
#import "CityDataModel.h"

@interface CityViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView    *tableView;
    NSMutableArray *dataArray;
}
@end

@implementation CityViewController
static NSString *cellId=@"cellone";

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self initData];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createTableView];

}

- (void)initData {
//    [MBProgressHUD showMessage:@"加载中..." toView:self.view];
    dataArray = [NSMutableArray array];
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"jsonData" ofType:@"json"];
    NSData *data = [[NSFileManager defaultManager] contentsAtPath:dataPath];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
    NSArray *dataArr = [jsonDict objectForKey:@"response"];
    for (NSDictionary *dict in dataArr) {
    
        CityDataModel *model = [[CityDataModel alloc] initWithDictionary:dict];
        NSLog(@"%@",model.descriptionField);
        [dataArray addObject:model];
    }
    [tableView reloadData];
    [tableView.mj_header endRefreshing];
}

- (void)createTableView {
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth, ScreenHeight-50-20) style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.backgroundColor=[UIColor whiteColor];
    tableView.showsVerticalScrollIndicator=NO;
    tableView.separatorColor=[UIColor clearColor];
    [tableView registerClass:[CItyGuideCell class] forCellReuseIdentifier:cellId];

    [self.view addSubview:tableView];
    
    MJRefreshNormalHeader *mjheader=[MJRefreshNormalHeader headerWithRefreshingBlock:^{

        [self initData];
    }];
    [mjheader setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [mjheader setTitle:@"释放立即刷新" forState:MJRefreshStatePulling];
    [mjheader setTitle:@"正在刷新..." forState:MJRefreshStateRefreshing];
    tableView.mj_header=mjheader;

    MJRefreshAutoNormalFooter *mjfooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

            [tableView.mj_footer endRefreshing];
        });
    }];
    [mjfooter setTitle:@"" forState:MJRefreshStateIdle];
    [mjfooter setTitle:@"正在加载更多..." forState:MJRefreshStateRefreshing];
    [mjfooter setTitle:@"" forState:MJRefreshStateNoMoreData];
    tableView.mj_footer=mjfooter;
    
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (dataArray.count>0) {
        return dataArray.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CItyGuideCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    // 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅
    [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
    CityDataModel *model = dataArray[indexPath.section];
    cell.sprView = self.view;
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // >>>>>>>>>>>>>>>>>>>>> * cell自适应 * >>>>>>>>>>>>>>>>>>>>>>>>
    id model =dataArray[indexPath.section];
    CityDataModel *dataModel = dataArray[indexPath.section];
//    if (dataModel.isPromote == YES) {
//        NSLog(@"%f",[tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[CityGuideBigCell class] contentViewWidth:ScreenWidth]);
//
//        return [tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[CityGuideBigCell class] contentViewWidth:ScreenWidth];
//    }else{
        NSLog(@"%f",[tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[CItyGuideCell class] contentViewWidth:ScreenWidth]);

        return [tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[CItyGuideCell class] contentViewWidth:ScreenWidth];
//    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 15)];
    return header;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

@end
