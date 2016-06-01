//
//  MMListController.m
//  DynamicBehaviors
//
//  Created by Apple on 16/6/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMListController.h"
#import "MMDemoController.h"

@interface MMListController () {
    // 下划线的成员变量!
    // 所有行为的集合
    NSArray *_behaviorsArr;

}

@end

@implementation MMListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置标题
    // 直接设置title -> 导航栏的标题 及 tabBarItem的title同时设置!
    self.title = @"仿真行为";
    
    // 2.设置集合数据
    _behaviorsArr = @[
                      @"吸附行为",
                      @"推动行为",
                      @"刚性附着行为",
                      @"弹性附着行为",
                      @"碰撞检测"
                      ];
    
    // 3.不显示多余的行
    self.tableView.tableFooterView = [[UIView alloc] init];
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // 1.创建demoVc对象
    MMDemoController *demoVc = [[MMDemoController alloc] init];
    
    // 2.设置标题
    demoVc.navigationItem.title = _behaviorsArr[indexPath.row];
    
    // 3.跳转
    [self.navigationController pushViewController:demoVc animated:YES];
}


#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _behaviorsArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // 1.cell
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
        // 设置箭头!
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // 2.数据
    cell.textLabel.text = _behaviorsArr[indexPath.row];
    
    // 3.返回
    return cell;

}

@end
