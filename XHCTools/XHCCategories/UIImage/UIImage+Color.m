//
//  UIImage+Color.m
//  redlips
//
//  Created by David on 15/4/9.
//  Copyright (c) 2015年 xiaohongchun. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

- (UIImage *)imageTintedWithColor:(UIColor *)color
{
    if (color) {
        // Construct new image the same size as this one.
        UIImage *image;
        UIGraphicsBeginImageContextWithOptions([self size], NO, [UIScreen mainScreen].scale); // 0.0 for scale means "scale for device's main screen".
        CGRect rect = CGRectZero;
        rect.size = [self size];
        
        // tint the image
        [self drawInRect:rect];
        [color set];
        UIRectFillUsingBlendMode(rect, kCGBlendModeMultiply);
        
        // restore alpha channel
        [self drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1.0f];
        
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;
    }
    
    return nil;
}

@end
