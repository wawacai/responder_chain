//
//  TwoView.m
//  基于ResponderChain的对象交互方式
//
//  Created by 彭作青 on 2017/9/4.
//  Copyright © 2017年 myself. All rights reserved.
//

#import "TwoView.h"
#import "ThreeView.h"

@interface TwoView ()
@property (nonatomic, strong) ThreeView *test3View;
@end

@implementation TwoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - getters and setters

- (void)setupUI {
    [self addSubview:self.test3View];
    
    [self setConstraints];
}

- (void)setConstraints {
    
}

- (ThreeView *)test3View {
    if (_test3View == nil) {
        _test3View = [[ThreeView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _test3View.backgroundColor = [UIColor purpleColor];
    }
    return _test3View;
}

@end
