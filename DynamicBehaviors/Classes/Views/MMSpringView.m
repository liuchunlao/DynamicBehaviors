//
//  MMSpringView.m
//  DynamicBehaviors
//
//  Created by Apple on 16/6/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMSpringView.h"

@implementation MMSpringView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 设置附着行为的振幅和频率
        // 振幅
        self.attachment.damping = 0.5;
        // 频率
        self.attachment.frequency = 0.5;
        
        
        // 线不画,结束后不能一直重绘!
        // 第一种办法,进来一直刷新
        // 开启定时器,进行刷新
//        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(refresh)];
//        [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        
        // MARK: - 2.第二种办法,了解 黑魔法! KVO  & KVC
        // KVO-> 键值监听 本质 -> 通过通知实现的
        // 原理:轮询! -> 一直在咨询.性能比较差!用的并不多!
        // 1~4个窗口!
        /**
         self.boxView -> 被监听的对象
         observer     -> 监听者
         keyPaht      -> 监听什么属性
         options      -> 监听的值
         context      -> 上下文信息,可以写nil
         */
        [self.boxView addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionOld context:@"1212"];
    
        
    }
    return self;
}

//- (void)refresh {
//
//    [self setNeedsDisplay];
//}

// KVO的监听方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    NSLog(@"中心点变了 %@", change);
    [self setNeedsDisplay];

}

- (void)dealloc {

    [self.boxView removeObserver:self forKeyPath:@"center"];
}




@end
