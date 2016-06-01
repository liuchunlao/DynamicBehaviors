//
//  MMAttachmentView.m
//  DynamicBehaviors
//
//  Created by Apple on 16/6/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMAttachmentView.h"

@interface MMAttachmentView () {

    /**
     *  附着点的图片框
     */
    UIImageView *_anchorImgView;
    
    /**
     *  从中心点偏移后得到的图片框
     */
    UIImageView *_offsetImgView;
}

/**
 如果是控件 -> weak
 如果是数据 -> strong
 
 比较特殊:
 懒加载数据 -> strong
 懒加载控件 -> strong
 
 字符串   -> copy
 block   -> copy
 
 */

@end

@implementation MMAttachmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.boxView.center = CGPointMake(self.center.x, 250);
        
        // MARK: - 1.需要先添加行为,画线!
        // 1.附着行为
        /**
         Item : 执行附着行为的元素
         offset: 偏移的距离!  -> 从中心点偏移多少距离  20, 20
         anchor: 附着点!
         */
        CGPoint anchorP = CGPointMake(self.center.x, 100);
        UIOffset offset = UIOffsetMake(-20, -20);
        
        UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.boxView offsetFromCenter:offset attachedToAnchor:anchorP];
        
        // 2.添加给仿真者
        [self.animator addBehavior:attachment];
        
        // 赋值
        _attachment = attachment;
        
        // MARK: - 2.添加小图片框
        // 1.加载图片
        UIImage *image = [UIImage imageNamed:@"AttachmentPoint_Mask"];
        
        // 2.附着点的图片框
        UIImageView *anchorImgView = [[UIImageView alloc] initWithImage:image];
        anchorImgView.center = anchorP;
        
        [self addSubview:anchorImgView];
        // 赋值
        _anchorImgView = anchorImgView;
        
        // 3.boxView身上的图片框
        UIImageView *offsetImgView = [[UIImageView alloc] initWithImage:image];
        
        CGSize size = self.boxView.bounds.size;
        offsetImgView.center = CGPointMake(size.width * 0.5 + offset.horizontal, size.height * 0.5 + offset.vertical);
        
        [self.boxView addSubview:offsetImgView];
        // 赋值
        _offsetImgView = offsetImgView;
        
        // MARK: - 3.拖拽
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        [self addGestureRecognizer:pan];
        
    }
    return self;
}

// 拖拽屏幕时调用
- (void)panAction:(UIPanGestureRecognizer *)recognizer {

    // 获取触摸点
    CGPoint loc = [recognizer locationInView:self];
    
    // 修改附着点
    self.attachment.anchorPoint = loc;
    
    // 修改图片框的中心点
    _anchorImgView.center = loc;
    // 重绘
    [self setNeedsDisplay];

}

- (void)drawRect:(CGRect)rect {
    
    // 1.创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 2.设置起点
    [path moveToPoint:_anchorImgView.center];
    
    // 3.画线
    // 3.1 转换坐标系
    /**
     *  convert 转换  - > 将 _offsetImgView.center 点从boxView身上转为相对于self的[一个点]!
     */
    CGPoint endP = [self convertPoint:_offsetImgView.center fromView:self.boxView];
    
    [path addLineToPoint:endP];
    
    // 3.2 线宽及线头样式
    path.lineWidth = 10;
    path.lineCapStyle = kCGLineCapRound;
    
    [[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1.0] setStroke];
    
    
    // 4.渲染
    [path stroke];
}


@end
