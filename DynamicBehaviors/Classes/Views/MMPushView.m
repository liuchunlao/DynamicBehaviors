//
//  MMPushView.m
//  DynamicBehaviors
//
//  Created by Apple on 16/6/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMPushView.h"
@interface MMPushView () {
    
    /**
     *  小图片
     */
    UIImageView *_imgView;
    
    /**
     *  当前点
     */
    CGPoint _currenP;

}


@end

@implementation MMPushView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // MARK: - 1.图片框
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        
        imgView.hidden = YES;
        
        [self addSubview:imgView];
        
        // 赋值
        _imgView = imgView;
        
        
        // MARK: - 2.拖拽手势识别器
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        [self addGestureRecognizer:pan];
    }
    return self;
}

#pragma mark - 拖拽屏幕的时候调用!
- (void)panAction:(UIPanGestureRecognizer *)recognizer {

    // 1.获取触摸点
    CGPoint loc = [recognizer locationInView:self];
    
    // 判断状态,执行不同操作!
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        // 2.1 开始
        // - 需要显示图片,并放到触摸点的位置
        _imgView.center = loc;
        _imgView.hidden = NO;
        
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        
        // 2.2 移动
        // - 记录当前点
        _currenP = loc;
        
        // - 重绘
        [self setNeedsDisplay];
        
        
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        // 2.3 结束
        _imgView.hidden = YES;
        
        // - 清除线
        _imgView.center = CGPointZero;
        _currenP = CGPointZero;
        
        [self setNeedsDisplay];
        
    }


}

#pragma mark - 进行绘图操作
- (void)drawRect:(CGRect)rect {
    
    // 1.创建路径对象
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 1.1 设置起点
    [path moveToPoint:_imgView.center];
    
    // 1.2 添加线
    [path addLineToPoint:_currenP];
    
    // 1.3 线宽及线头样式
    path.lineWidth = 10;
    path.lineCapStyle = kCGLineCapRound;
    
    
    [[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1.0] setStroke];
    
    // 2.渲染
    [path stroke];

}

@end
