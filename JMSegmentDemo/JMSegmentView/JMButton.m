//
//  JMButton.m
//  JMSegmentDemo
//
//  Created by Jin on 2017/3/24.
//  Copyright © 2017年 Jin. All rights reserved.
//

#import "JMButton.h"
@interface JMButton()

@property (nonatomic, strong) UIImageView *upDownImageView;

@property (nonatomic, strong) UIImage *upImage;

@property (nonatomic, strong) UIImage *downImage;

@end

@implementation JMButton

- (UIImageView *)upDownImageView {
    if (_upDownImageView == nil) {
        _upDownImageView = [[UIImageView alloc]init];
        _upDownImageView.image = [UIImage imageNamed:@"sort_up"];
    }
    return _upDownImageView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        //        _isUp = YES;
    }
    return self;
}
//重写button的isSelected的set方法
- (BOOL)isSelected {
    //    NSLog(@"tag = %zd, isSelected = %@",self.tag,[super isSelected]?@"")
    if ([super isSelected]) {
        _upImage = [UIImage imageNamed:@"sort_up"];
        _downImage = [UIImage imageNamed:@"sort_down"];
    } else {
        _upImage = [UIImage imageNamed:@"sort_up"];
        _downImage = [UIImage imageNamed:@"sort_down"];
    }
    //刷新箭头方向
    [self recoverImage];
    return [super isSelected];
}
//根据按钮状态刷新箭头方向
- (void)recoverImage {
    if (_isUp) {
        _upDownImageView.image = _upImage;
    } else {
        _upDownImageView.image = _downImage;
    }
}
//改变箭头方向，提供接口于.h文件中，可供外部调用
- (void)changeDirection {
    if (_isUp) {
        _upDownImageView.image = _upImage;
    } else {
        _upDownImageView.image = _downImage;
    }
    _isUp = !_isUp;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //设置图片位置
    self.upDownImageView.frame = CGRectMake(self.frame.size.width - 10, (self.frame.size.height - 12) / 2.0f, 8, 12);
    [self addSubview:self.upDownImageView];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
