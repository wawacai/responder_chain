//
//  ThreeView.m
//  基于ResponderChain的对象交互方式
//
//  Created by 彭作青 on 2017/9/4.
//  Copyright © 2017年 myself. All rights reserved.
//

#import "ThreeView.h"
#import "UIResponder+Router.h"

NSString * const firstEventStr = @"firstEventStr";
NSString * const secondEventStr = @"secondEventStr";

@interface ThreeView ()

@property (nonatomic, strong) UIButton *signalButton;
@property (nonatomic, strong) UIButton *secondButton;

@end

@implementation ThreeView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - event response

- (void)test {
    NSLog(@"1按钮被点击了");
    [self routerEventWithName:firstEventStr userInfo:@{@"three":@"我是three第一个按钮"}];
}

- (void)test2 {
    NSLog(@"2按钮被点击了");
    [self routerEventWithName:secondEventStr userInfo:@{@"three":@"我是three第二个按钮"}];
}

#pragma mark - getters and setters

- (void)setupUI {
    [self addSubview:self.signalButton];
    [self addSubview:self.secondButton];
    
    [self setConstraints];
}

- (void)setConstraints {
    
}

- (UIButton *)secondButton {
    if (_secondButton == nil) {
        _secondButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 35, 80, 20)];
        [_secondButton setTitle:@"测试按钮_2" forState:UIControlStateNormal];
        _secondButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_secondButton addTarget:self action:@selector(test2) forControlEvents:UIControlEventTouchUpInside];
    }
    return _secondButton;
}

- (UIButton *)signalButton {
    if (_signalButton == nil) {
        _signalButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 80, 20)];
        [_signalButton setTitle:@"测试按钮_1" forState:UIControlStateNormal];
        _signalButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_signalButton addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    }
    return _signalButton;
}

@end
