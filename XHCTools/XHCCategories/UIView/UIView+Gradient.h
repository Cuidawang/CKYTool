//
//  UIView+Gradient.h
//  redlips
//
//  Created by zizp on 15/11/23.
//  Copyright © 2015年 xiaohongchun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Gradient)

/**
 *  黑到白的渐变
 */
- (void)gradientWhiteToBlack;

/**
 *  根据颜色起始点和终点设置渐变
 */
- (void)gradientWithColorArray:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end
