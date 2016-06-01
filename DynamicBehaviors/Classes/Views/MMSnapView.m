//
//  MMSnapView.m
//  DynamicBehaviors
//
//  Created by Apple on 16/6/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMSnapView.h"

@implementation MMSnapView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 点按
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapAction:(UITapGestureRecognizer *)recognizer {

    // 0.直接移除所有行为
//    [self.animator removeAllBehaviors];
    
    NSLog(@"点按");
    // 1.获取触摸点
    CGPoint loc = [recognizer locationInView:self];
    
    // MARK: - 2.吸附行为相关的代码
    // 1.仿真者,方块?
    // 2.1 创建吸附行为
    /**
     Item 执行行为的元素
     point 吸附点!
     */
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.boxView snapToPoint:loc];
    
    // 2.2 添加给仿真者
    [self.animator addBehavior:snap];

}

@end
