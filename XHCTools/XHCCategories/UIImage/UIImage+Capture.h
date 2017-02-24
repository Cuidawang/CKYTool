//
//  UIImage+Capture.h
//  910Helper
//
//  Created by zizp on 15/5/28.
//  Copyright (c) 2015年 Lucky_Truda. All rights reserved.
//

#import <UIKit/UIKit.h>

enum {
    enSvCropClip,       /**< clip模式下，旋转后的图片和原图一样大，部分图片区域会被裁剪掉 */
    enSvCropExpand,     /**< expand模式下，旋转后的图片可能会比原图大，所有的图片信息都会保留，剩下的区域会是全透明的 */
};

typedef NSInteger SvCropMode;

@interface UIImage (Capture)

/**
*  截屏
*
*  @param view 被截取的view
*/
+ (UIImage *)captureWithView:(UIView *)view;


/**
 *  压缩图片到指定size大小
 *
 *  @param img  被压缩的图片
 *  @param size 压缩的size
 *
 */
+ (UIImage *)scaleImageToSize:(UIImage *)img size:(CGSize)size;


/**
 *  截取指定位置的图片(按像素截取)
 */
+ (UIImage *)cropImage:(UIImage *)image targetRect:(CGRect)targetRect;

/*
 *  图片旋转
 */
+ (UIImage *)rotateImageWithRadian:(CGFloat)radian cropMode:(SvCropMode)cropMode image:(UIImage *)image;


@end
