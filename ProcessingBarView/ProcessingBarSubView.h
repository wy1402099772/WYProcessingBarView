//
//  ProcessingBarSubView.h
//  WYProcessingBarView
//
//  Created by wyan assert on 2016/10/22.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ProcessingBarSubView : UIView

@property (nonatomic, assign) BOOL isReverse;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, assign) CGFloat cornerRadius;

- (void)setDrawFactor:(CGFloat)drawFactor;

@end
