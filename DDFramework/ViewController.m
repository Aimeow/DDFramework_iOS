//
//  ViewController.m
//  DDFramework
//
//  Created by Aimeow on 7/8/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import "ViewController.h"
#import "DDHttpManager.h"
#import "DDBannerModel.h"

@interface ViewController () <UIScrollViewDelegate >

//@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) DDBannerModel *model;


@end

@implementation ViewController
//- (IBAction)dotest:(id)sender {
//    [self.model loadData];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.model = [DDBannerModel model];
    self.model.isSubBanner = YES;
    
   [RACObserve(self.model, bannerArray) subscribeNext:^(NSMutableArray *array) {
       NSLog(@"%@" , array);
       ///NSObject调用print方法(NSObject+allProperties.h中的方法)可以遍历出所有的变量，可以在lldb中实用po调用(建议)，也可以在代码中调用（不建议），方便调试
       for (DDBannerEntity *entity in array) {
           [entity print];
       }
   }];
    
//    ///self.model.dataTask是系统中的NSURLSessionDataTask，可以做很多基础的操作
//    ///可以停掉当前的请求
//    [self.model.dataTask cancel];
//    ///启动当前请求
//    [self.model.dataTask resume];
//

    
}

@end
