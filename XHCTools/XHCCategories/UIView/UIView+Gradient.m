//
//  UIView+Gradient.m
//  redlips
//
//  Created by zizp on 15/11/23.
//  Copyright © 2015年 xiaohongchun. All rights reserved.
//

#import "UIView+Gradient.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Gradient)

- (void)gradientWhiteToBlack
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[UIColor clearColor].CGColor,
                            //(id)[UIColor whiteColor].CGColor,
                            [(id)[UIColor blackColor] colorWithAlphaComponent:1.f].CGColor, nil];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    [self.layer addSublayer:gradientLayer];
}

- (void)gradientWithColorArray:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = colors;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    [self.layer addSublayer:gradientLayer];
}

@end
