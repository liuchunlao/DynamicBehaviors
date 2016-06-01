//
//  MMDemoController.h
//  DynamicBehaviors
//
//  Created by Apple on 16/6/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

// MARK: - 1.定义枚举
typedef enum {

    kDemoFuncSnap,
    kDemoFuncPush,
    kDemoFuncAttachment,
    kDemoFuncSpring,
    kDemoFuncCollision

} kDemoFunc;

@interface MMDemoController : UIViewController

/**
 *  功能代号
 */
//@property (nonatomic, assign) int idx;

@property (nonatomic, assign) kDemoFunc funcId;

@end
