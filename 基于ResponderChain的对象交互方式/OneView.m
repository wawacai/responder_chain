//
//  OneView.m
//  基于ResponderChain的对象交互方式
//
//  Created by 彭作青 on 2017/9/4.
//  Copyright © 2017年 myself. All rights reserved.
//

#import "OneView.h"
#import "TwoView.h"
#import "UIResponder+Router.h"

@interface OneView ()
@property (nonatomic, strong) TwoView *testView;
@end

@implementation OneView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

// 拦截方法，添加额外信息
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    NSMutableDictionary *dictM = [[NSMutableDictionary alloc] initWithDictionary:userInfo];
    [dictM setObject:NSStringFromClass([self class]) forKey:@"one"];
    
    // 事件继续传递
    [super routerEventWithName:eventName userInfo:dictM.copy];
}

#pragma mark - getters and setters

- (void)setupUI {
    [self addSubview:self.testView];
    
    [self setConstraints];
}

- (void)setConstraints {
    
}

- (TwoView *)testView {
    if (_testView == nil) {
        _testView = [[TwoView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _testView.backgroundColor = [UIColor whiteColor];
    }
    return _testView;
}

@end
