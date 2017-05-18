//
//  BaseTableViewController.m
//  Neighbour
//
//  Created by 杜明悦 on 2016/10/24.
//  Copyright © 2016年 杜明悦. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseNavigationController.h"

@implementation BaseTableViewController

@synthesize header=_header;
@synthesize footer = _footer;

- (void)viewDidLoad {
    [super viewDidLoad];
}


/**
 设置上拉下拉刷新组件
 @param tableView 刷新的tableView
 **/
-(void)setRefreshView:(UITableView*)tableView{
    // 1. 添加刷新头部控件的方法
    _header = [MJRefreshHeaderView header];
    //隐藏时间标签
    [_header.lastUpdateTimeLabel setHidden:YES];
    _header.scrollView = tableView;
    _header.delegate = self;
    //2. 添加刷新尾部控件的方法
    _footer = [MJRefreshFooterView footer];
    _footer.scrollView = tableView;
    _footer.delegate = self;
    tableView.dataSource=self;
    tableView.delegate=self;
}

/**
 上拉下拉刷新
 @param refreshView 刷新组件
 **/
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{
    
    if([refreshView isMemberOfClass:[MJRefreshHeaderView class]]){
        //下拉头部执行
        [self pullDownToRefresh];
        
    }else if([refreshView isMemberOfClass:[MJRefreshFooterView class]]){
        //上拉底部执行
        [self pullUpToRefresh];
        
    }
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(stopRefreshing) userInfo:nil repeats:NO];
//    [timer fire];

}

/**
 下拉刷新操作，重写该方法实现下拉刷新后的处理
 **/
-(void)pullDownToRefresh{

}

/**
 上拉加载更多操作，重写该方法实现下拉刷新后的处理
 **/
-(void)pullUpToRefresh{

}

/**
 头部和底部停止刷新状态
 **/
-(void)stopRefreshing{
    [_header endRefreshing];
    [_footer endRefreshing];
}
@end
