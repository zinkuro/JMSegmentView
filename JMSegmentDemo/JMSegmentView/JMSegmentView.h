//
//  JMSegmentView.h
//  JMSegmentDemo
//
//  Created by Jin on 2017/3/24.
//  Copyright © 2017年 Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JMButton;

@protocol JMSegmentViewDelegate <NSObject>

@optional
/*
 * @brief 点击改变了按钮朝向的事件
 * @param 改变朝向的按钮
 */
- (void)changeButtonDirection:(JMButton *)button;
/*
 * @brief 选中了按钮的事件
 * @param 选中的按钮
 */
- (void)selectSegmentButton:(JMButton *)button;
@end

@interface JMSegmentView : UIView

@property (nonatomic, weak) id<JMSegmentViewDelegate> delegate;
/*
 * @brief 设置分段标题
 * @param 标题名称的数组
 */
- (void)setTitlesOfSegments:(NSArray *)titlesOfSegments;

@end
