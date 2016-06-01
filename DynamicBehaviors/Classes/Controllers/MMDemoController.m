//
//  MMDemoController.m
//  DynamicBehaviors
//
//  Created by Apple on 16/6/1.
//  Copyright © 2016年 itcast. All rights reserved.
//  显示各种不同的的控制器

#import "MMDemoController.h"
#import "MMBaseView.h"

@interface MMDemoController ()

@end

@implementation MMDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    // MARK: - 1.演示baseView
    MMBaseView *baseView = [[MMBaseView alloc] initWithFrame:self.view.bounds];
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
