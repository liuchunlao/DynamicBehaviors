//
//  MMPushView.m
//  DynamicBehaviors
//
//  Created by Apple on 16/6/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMPushView.h"
@interface MMPushView () {
    
    // 小图片
    UIImageView *_imgView;

}


@end

@implementation MMPushView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // MARK: - 1.图片框
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        
        imgView.center = self.center;
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
        
        
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        // 2.3 结束
        _imgView.hidden = YES;
    }


}

@end
