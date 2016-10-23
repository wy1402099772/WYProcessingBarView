//
//  ProcessingBarSubView.m
//  WYProcessingBarView
//
//  Created by wyan assert on 2016/10/22.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import "ProcessingBarSubView.h"

@interface ProcessingBarSubView ()

@property (nonatomic, assign) CGFloat drawFactor;

@end

@implementation ProcessingBarSubView

@synthesize drawFactor = _drawFactor;

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawBackground:context inRect:rect];
    [self drawProcess:context inRect:rect];
}

- (void)drawBackground:(CGContextRef)context inRect:(CGRect)rect {
    CGContextSaveGState(context);
    
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:0];
    CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);
    [roundedRect fill];
    
    CGContextRestoreGState(context);
}

- (void)drawProcess:(CGContextRef)context inRect:(CGRect)frame {
    CGContextSaveGState(context);
    
    CGFloat originX = 0;
    CGFloat width = 1.2 * frame.size.width;
    if(self.isReverse) {
         originX = frame.size.width - self.drawFactor * frame.size.width;
    } else {
        originX = 0 - width + self.drawFactor * frame.size.width;
    }
    CGRect rect = CGRectMake(originX, 0, width, frame.size.height);
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:self.cornerRadius];
    CGContextSetFillColorWithColor(context, self.tintColor.CGColor);
    [roundedRect fill];
    
    CGContextRestoreGState(context);
}

#pragma mark - Getter
- (BOOL)isReverse {
    return _isReverse;
}

- (UIColor *)tintColor {
    if(!_tintColor) {
        _tintColor = [UIColor colorWithRed:0 green:0.43 blue:0.82 alpha:1];
    }
    return _tintColor;
}

- (UIColor *)backgroundColor {
    if(!_backgroundColor) {
        _backgroundColor = [UIColor blackColor];
    }
    return _backgroundColor;
}

- (CGFloat)drawFactor {
    return _drawFactor;
}


#pragma mark - Setter
- (void)setDrawFactor:(CGFloat)drawFactor {
    _drawFactor = drawFactor;
    [self setNeedsDisplay];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    [self setNeedsDisplay];
}

@end
