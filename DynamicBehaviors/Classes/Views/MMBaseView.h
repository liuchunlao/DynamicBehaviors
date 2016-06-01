//
//  MMBaseView.h
//  DynamicBehaviors
//
//  Created by Apple on 16/6/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMBaseView : UIView

/**
 *  执行仿真的方块视图
 */
@property (nonatomic, weak) UIImageView *boxView;

/**
 *  仿真者
 */
@property (nonatomic, strong) UIDynamicAnimator *animator;

@end
