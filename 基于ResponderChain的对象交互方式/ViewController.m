//
//  ViewController.m
//  基于ResponderChain的对象交互方式
//
//  Created by 彭作青 on 2017/9/4.
//  Copyright © 2017年 myself. All rights reserved.
//

#import "ViewController.h"
#import "OneView.h"
#import "UIResponder+Router.h"

@interface ViewController ()

@property (nonatomic, strong) OneView *test1View;
@property (nonatomic, strong) NSDictionary *eventStrategy;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    [self setupUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event response

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    NSInvocation *invocation = self.eventStrategy[eventName];
    [invocation setArgument:&userInfo atIndex:2];
    [invocation invoke];
}

- (void)firstEvent:(NSDictionary *)userInfo {
    NSLog(@"%@",userInfo);
}

- (void)secondEvent:(NSDictionary *)userInfo {
    NSLog(@"%@",userInfo);
}

#pragma mark - getters and setters

- (void)setupUI {
    [self.view addSubview:self.test1View];
    
    [self setConstraints];
}

- (void)setConstraints {
    
}

- (OneView *)test1View {
    if (_test1View == nil) {
        _test1View = [[OneView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
        _test1View.backgroundColor = [UIColor yellowColor];
    }
    return _test1View;
}

- (NSDictionary<NSString *, NSInvocation *> *)eventStrategy
{
    if (!_eventStrategy) {
        extern NSString * const firstEventStr;
        extern NSString * const secondEventStr;
        
        _eventStrategy = @{
                           firstEventStr: [self createInvocationWithSelector:@selector(firstEvent:)],
                           secondEventStr: [self createInvocationWithSelector:@selector(secondEvent:)]
                           };
    }
    return _eventStrategy;
}

@end
