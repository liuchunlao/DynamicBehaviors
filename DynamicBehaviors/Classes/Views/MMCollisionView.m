//
//  MMCollisionView.m
//  DynamicBehaviors
//
//  Created by Apple on 16/6/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMCollisionView.h"

@interface MMCollisionView () <UICollisionBehaviorDelegate>

@end

@implementation MMCollisionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // MARK: - 1.创建红色视图
        UIView *magV = [[UIView alloc] initWithFrame:CGRectMake(0, 400, 180, 40)];
        
        magV.backgroundColor = [UIColor magentaColor];
        
//        [self addSubview:magV];
        
        
        // MARK: - 2.重力
        UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.boxView]];
        
        [self.animator addBehavior:gravity];
        
        // MARK: - 3.碰撞检测
        UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.boxView]];
        
        // 设置代理
        collision.collisionDelegate = self;
        
        collision.translatesReferenceBoundsIntoBoundary = YES;
        
        // MARK: - 3.1以直线的形式添加边界
//        [collision addBoundaryWithIdentifier:@"123" fromPoint:CGPointMake(0, 400) toPoint:CGPointMake(180, 400)];
        
        
        //MARK: - 3.2以路径的形式添加边界
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 400) radius:150 startAngle:-M_PI endAngle:0 clockwise:NO];
        
        [collision addBoundaryWithIdentifier:@"456" forPath:path];
        
        
        [self.animator addBehavior:collision];
        
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {

    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 400) radius:150 startAngle:-M_PI endAngle:0 clockwise:NO];
    
    [path stroke];

}

#pragma mark - 代理方法
- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {

    NSLog(@"%@  %@", identifier, item);
    
    self.boxView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1.0];

}

@end
