//
//  MMAttachmentView.m
//  DynamicBehaviors
//
//  Created by Apple on 16/6/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMAttachmentView.h"

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
        UIOffset offset = UIOffsetMake(20, 20);
        
        UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.boxView offsetFromCenter:offset attachedToAnchor:anchorP];
        
        // 2.添加给仿真者
        [self.animator addBehavior:attachment];
        
        // MARK: - 2.添加小图片框
        // 1.加载图片
        UIImage *image = [UIImage imageNamed:@"AttachmentPoint_Mask"];
        
        // 2.附着点的图片框
        UIImageView *anchorImgView = [[UIImageView alloc] initWithImage:image];
        anchorImgView.center = anchorP;
        
        [self addSubview:anchorImgView];
        
        // 3.boxView身上的图片框
        UIImageView *offsetImgView = [[UIImageView alloc] initWithImage:image];
        
        CGSize size = self.boxView.bounds.size;
        offsetImgView.center = CGPointMake(size.width * 0.5 + offset.horizontal, size.height * 0.5 + offset.vertical);
        
        [self.boxView addSubview:offsetImgView];
        
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
//    // 1.创建路径
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    
//    // 2.设置起点
//    
//    // 3.画线
//    
//    // 4.渲染


}


@end
