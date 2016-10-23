//
//  ProcessingBarView.m
//  WYProcessingBarView
//
//  Created by wyan assert on 2016/10/22.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import "ProcessingBarView.h"
#import "ProcessingBarSubView.h"

@interface ProcessingBarView ()

@property (nonatomic, strong) ProcessingBarSubView  *leftView;
@property (nonatomic, strong) ProcessingBarSubView  *rightView;
@property (nonatomic, strong) NSTimer               *timer;
@property (nonatomic, assign) CGFloat               progress;

@end

@implementation ProcessingBarView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self configureView];
        [self configureTimer];
    }
    return self;
}

#pragma mark - Private
- (void)configureView {
    [self addSubview:self.leftView];
    [self addSubview:self.rightView];
}

- (void)configureTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.010 target:self selector:@selector(changeProgress) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

#pragma mark - Public
- (void)changeProgress {
    self.progress += 0.03;
    if(self.progress >= 2.2) {
        self.progress = 0;
    }
    [self.leftView setDrawFactor:self.progress];
    [self.rightView setDrawFactor:self.progress];
}

#pragma mark - Getter
- (ProcessingBarSubView *)leftView {
    if(!_leftView) {
        _leftView = [[ProcessingBarSubView alloc] initWithFrame:CGRectMake(self.frame.origin.x,
                                                                           self.frame.origin.y,
                                                                           self.frame.size.width / 2.0,
                                                                           self.frame.size.height)];
        _leftView.backgroundColor = self.backgroundColor;
        _leftView.tintColor = self.tintColor;
        _leftView.isReverse = YES;
    }
    return _leftView;
}

- (ProcessingBarSubView *)rightView {
    if(!_rightView) {
        _rightView = [[ProcessingBarSubView alloc] initWithFrame:CGRectMake(self.frame.origin.x + self.frame.size.width / 2.0,
                                                                           self.frame.origin.y,
                                                                           self.frame.size.width / 2.0,
                                                                           self.frame.size.height)];
        _rightView.backgroundColor = self.backgroundColor;
        _rightView.tintColor = self.tintColor;
        _rightView.isReverse = NO;
    }
    return _rightView;
}

#pragma mark - Setter
- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.leftView.cornerRadius = cornerRadius;
    self.rightView.cornerRadius = cornerRadius;
}

@end
