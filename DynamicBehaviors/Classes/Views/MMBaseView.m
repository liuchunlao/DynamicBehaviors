//
//  MMBaseView.m
//  DynamicBehaviors
//
//  Created by Apple on 16/6/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMBaseView.h"

@implementation MMBaseView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // MARK: - 1.设置背景
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
        
        // MARK: - 2.小方块
        UIImageView *boxV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box1"]];
        boxV.center = CGPointMake(self.center.x, 120);
        
        [self addSubview:boxV];
        
        // 赋值
        _boxView = boxV;
        
        // MARK: - 3.仿真者
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
        
    }
    return self;
}



@end
