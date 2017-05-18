//
//  BaseTableViewController.h
//  Neighbour
//
//  Created by 杜明悦 on 2016/10/24.
//  Copyright © 2016年 杜明悦. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ESInitializeViewController.h"
#import "ESValidatorViewController.h"
#import "DataTable.h"
#import "DataCollection.h"
#import "Data.h"
#import "ESReleaseViewController.h"
#import "ESDataQueryViewController.h"
#import "UIViewPassValueDelegate.h"
#import "ESCollectViewController.h"
#import "Toast+UIView.h"
#import "MJRefresh.h"

// 获得屏幕尺寸
#define SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height

IB_DESIGNABLE
@class BaseNavigationController;

@interface BaseTableViewController:BaseViewController<MJRefreshBaseViewDelegate,UIViewPassValueDelegate,UITableViewDelegate,UITableViewDataSource>
{
    //下拉或上拉刷新组件
    MJRefreshHeaderView *_header;
    MJRefreshFooterView *_footer;
}

/**
 获取UITableView头部视图
 **/
@property (strong, nonatomic, null_unspecified) MJRefreshHeaderView *header;

/**
 获取UITableView页脚视图
 **/
@property (strong, nonatomic, null_unspecified) MJRefreshFooterView *footer;


/**
 设置上拉下拉刷新组件
 @param tableView 刷新的tableView
 **/
-(void)setRefreshView:(null_unspecified UITableView*)tableView;

/**
 上拉下拉刷新
 @param refreshView 刷新组件
 **/
-(void)refreshViewBeginRefreshing:(nonnull MJRefreshBaseView *)refreshView;

/**
 下拉刷新操作，重写该方法实现下拉刷新后的处理
 **/
-(void)pullDownToRefresh;

/**
 上拉加载更多操作，重写该方法实现下拉刷新后的处理
 **/
-(void)pullUpToRefresh;

/**
 头部和底部停止刷新状态
 **/
-(void)stopRefreshing;

@end
