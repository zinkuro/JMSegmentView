//
//  JMButton.h
//  JMSegmentDemo
//
//  Created by Jin on 2017/3/24.
//  Copyright © 2017年 Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMButton : UIButton
/**
 *  箭头的状态是否向上
 */
@property (nonatomic, assign) BOOL isUp;
/**
 *  改变箭头方向
 */
- (void)changeDirection;
- (void)recoverImage;
@end
