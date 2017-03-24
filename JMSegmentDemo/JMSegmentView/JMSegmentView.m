//
//  JMSegmentView.m
//  JMSegmentDemo
//
//  Created by Jin on 2017/3/24.
//  Copyright © 2017年 Jin. All rights reserved.
//

#import "JMSegmentView.h"
#import "JMButton.h"
#define BUTTON_TAG 1000
@interface JMSegmentView()

@property (nonatomic, strong) NSArray *titlesOfSegments;
@property (nonatomic, strong) NSMutableArray<JMButton *> *segmentArray;

@end

@implementation JMSegmentView

- (void)setTitlesOfSegments:(NSArray *)titlesOfSegments {
    _titlesOfSegments = titlesOfSegments;
    self.segmentArray = [NSMutableArray array];
    for (NSInteger i = 0; i < _titlesOfSegments.count; i++) {
        
        JMButton *segmentButton = [[JMButton alloc]init];
        
        [segmentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [segmentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [segmentButton setTitleColor:[UIColor colorWithRed:0/255.0f green:122/255.0f blue:255/255.0f alpha:1.0] forState:UIControlStateNormal];
        
        [segmentButton setTitle:_titlesOfSegments[i] forState:UIControlStateNormal];
        
        [segmentButton addTarget:self action:@selector(segmentButtonHighlited:) forControlEvents:UIControlEventTouchDown];
        [segmentButton addTarget:self action:@selector(segmenDragOutside:) forControlEvents:UIControlEventTouchDragOutside];
        [segmentButton addTarget:self action:@selector(segmenDragInside:) forControlEvents:UIControlEventTouchDragInside];
        [segmentButton addTarget:self action:@selector(segmentButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        segmentButton.tag = BUTTON_TAG + i;
        
        [self.segmentArray addObject:segmentButton];
        
        [self addSubview:segmentButton];
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 4;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor colorWithRed:0/255.0f green:122/255.0f blue:255/255.0f alpha:1.0].CGColor;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat segmentWidth = self.bounds.size.width / (CGFloat)self.titlesOfSegments.count;
    CGFloat segmentHeight = self.bounds.size.height;
    //分割线设置
    for (NSInteger i = 1; i < self.segmentArray.count; i++) {
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor colorWithRed:0/255.0f green:122/255.0f blue:255/255.0f alpha:1.0];
        lineView.frame = CGRectMake(i * segmentWidth, 0, 1, segmentHeight);
        [self addSubview:lineView];
    }
    //按钮初始化，初次显示设置第一分段为选中状态
    for (NSInteger i = 0; i < self.segmentArray.count; i++) {
        self.segmentArray[i].frame = CGRectMake(i * segmentWidth, 0, segmentWidth, segmentHeight);
        if (i == 0) {
            self.segmentArray[i].isUp = YES;
        } else {
            self.segmentArray[i].isUp = NO;
        }
        
    }
    if (self.segmentArray.count > 0) {
        self.segmentArray[0].selected = YES;
        //        for (JMButton *unselectedButton in self.segmentArray) {
        //            unselectedButton.selected = NO;
        //        }
        [self.segmentArray[0] setBackgroundColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0]];
    }
    
}

//拖动出按钮范围方法
- (void)segmenDragOutside:(UIButton *)btn {
    //    NSLog(@"dragout");
    if (!btn.selected) {
        [btn setBackgroundColor:[UIColor whiteColor]];
    }
}
//拖动入按钮范围方法
- (void)segmenDragInside:(UIButton *)btn {
    //    NSLog(@"dragin");
    if (!btn.selected) {
        [btn setBackgroundColor:[UIColor colorWithRed:217/255.0 green:236/255.0 blue:255/255.0 alpha:1.0]];
    }
}

//高亮状态
- (void)segmentButtonHighlited:(UIButton *)btn {
    if (!btn.selected) {
        [btn setBackgroundColor:[UIColor colorWithRed:217/255.0 green:236/255.0 blue:255/255.0 alpha:1.0]];
    }
    if (btn.selected) {
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
}
//选中状态
- (void)segmentButtonSelected:(JMButton *)btn {
    if (!btn.selected) {
        btn.selected = !btn.selected;
        
        if ([self.delegate respondsToSelector:@selector(selectSegmentButton:)]) {
            [self.delegate selectSegmentButton:btn];
        }
    }else {
        [btn changeDirection];
        
        if ([self.delegate respondsToSelector:@selector(changeButtonDirection:)]) {
            [self.delegate changeButtonDirection:btn];
        }

    }
    
    if (btn.selected) {
        [btn setBackgroundColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0]];
    }else {
        [btn setBackgroundColor:[UIColor clearColor]];
    }
    //选中其中一个按钮后，其他按钮变为非选中状态
    for (JMButton *unSelectedButton in self.segmentArray) {
        if (unSelectedButton != btn) {
            [UIView animateWithDuration:0.25 animations:^{
                [unSelectedButton setBackgroundColor:[UIColor whiteColor]];
                [unSelectedButton setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
            }];
            unSelectedButton.selected = NO;
        }
    }
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    
//    
//}


@end
