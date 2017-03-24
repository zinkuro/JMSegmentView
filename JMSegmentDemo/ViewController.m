//
//  ViewController.m
//  JMSegmentDemo
//
//  Created by Jin on 2017/3/24.
//  Copyright © 2017年 Jin. All rights reserved.
//

#import "ViewController.h"
#import "JMSegmentView.h"
#import "JMButton.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

typedef enum : NSUInteger {
    SortByAge = 1000,
    SortByName,
    SortByRegisterTime,
    SortByLastLogin,
} SortType;

@interface ViewController () <JMSegmentViewDelegate>

@property (nonatomic, assign) SortType sortType;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JMSegmentView *segment = [[JMSegmentView alloc]initWithFrame:CGRectMake(10, 100, SCREEN_WIDTH - 20, 30)];
    segment.delegate = self;
    [segment setTitlesOfSegments:@[@"年龄",@"姓名",@"注册时间",@"上次登录"]];
    [self.view addSubview:segment];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - JMSegmentDelegate
//选中对应分段时的操作
- (void)selectSegmentButton:(JMButton *)button {
    self.sortType = button.tag;
    NSLog(@"%lu",(unsigned long)self.sortType);
}
//再次点选分段时改变上下箭头的操作
- (void)changeButtonDirection:(JMButton *)button {
    NSLog(@"%@",button.isUp?@"Up":@"Down");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
