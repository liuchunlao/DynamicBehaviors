//
//  MMDemoController.m
//  DynamicBehaviors
//
//  Created by Apple on 16/6/1.
//  Copyright © 2016年 itcast. All rights reserved.
//  显示各种不同的的控制器

#import "MMDemoController.h"
#import "MMBaseView.h"
#import "MMSnapView.h"
#import "MMPushView.h"
#import "MMAttachmentView.h"
#import "MMSpringView.h"
#import "MMCollisionView.h"

@interface MMDemoController ()

@end

@implementation MMDemoController
/**
 // MARK: - 1.演示baseView
 //    MMBaseView *baseView = [[MMBaseView alloc] initWithFrame:self.view.bounds];
 //    [self.view addSubview:baseView];
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    // MARK: - 1.需要根据不同的选项,加载不同的视图!
    
    // 根据传入的idx值,判断,加载不同的视图
    // 1.1 定义变量
    MMBaseView *baseView;
    
    // 1.2 判断,并设置值
    switch (self.idx) {
        case 0:
            // 多态!
            baseView = [[MMSnapView alloc] initWithFrame:self.view.bounds];
            break;
        case 1:
            baseView = [[MMPushView alloc] initWithFrame:self.view.bounds];
            break;
        case 2:
            baseView = [[MMAttachmentView alloc] initWithFrame:self.view.bounds];
            
            break;
        case 3:
            baseView = [[MMSpringView alloc] initWithFrame:self.view.bounds];
            
            break;
        case 4:
            baseView = [[MMCollisionView alloc] initWithFrame:self.view.bounds];
            
            break;
            
        default:
            break;
    }
    
    // 1.3 添加视图
    [self.view addSubview:baseView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
