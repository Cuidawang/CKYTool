//
//  UIImage+Blur.h
//  910Helper
//
//  Created by zizp on 15/5/29.
//  Copyright (c) 2015年 Lucky_Truda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Blur)

- (UIImage *)blurredImageWithRadius:(CGFloat)radius iterations:(NSUInteger)iterations tintColor:(UIColor *)tintColor;


/************** UIImage Filter **************/
//高斯模糊  blur:0 -- 1
- (UIImage *)imageGaussianBlurWithBlurLevel:(CGFloat)blur;

/*
 高斯模糊  blur:0 -- 1
 */
// 0.0 to 1.0
- (UIImage *)blurredImage:(CGFloat)blurAmount;

@end
