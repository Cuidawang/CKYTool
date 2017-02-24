//
//  UIImage+Capture.m
//  910Helper
//
//  Created by zizp on 15/5/28.
//  Copyright (c) 2015年 Lucky_Truda. All rights reserved.
//

#import "UIImage+Capture.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImage (Capture)

#pragma mark -===== 自定义截屏位置大小的逻辑代码 =====-

+ (UIImage *)captureWithView:(UIView *)view
{
    CGSize screenshotSize = CGSizeMake(CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds));
    //设置截屏大小
    //创建一个基于位图的上下文(context)，并将其设置为当前上下文
    //UIGraphicsBeginImageContext(screenshotSize);//（会模糊）相当于 UIGraphicsBeginImageContextWithOptions 的 opaque 参数为 NO , scale 因子为 1.0。
    UIGraphicsBeginImageContextWithOptions(screenshotSize, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[view layer] renderInContext:context];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    //移除栈顶的基于当前位图的图形上下文
    UIGraphicsEndImageContext();
    
    //保存图片到照片库
    //UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    
    return viewImage;
}

+ (UIImage *)scaleImageToSize:(UIImage *)img size:(CGSize)size
{
    // 并把它设置成为当前正在使用的context
    
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    
    // 从当前context中创建一个改变大小后的图片
    
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    
    UIGraphicsEndImageContext();
    
    //返回新的改变大小后的图片
    
    return scaledImage;
}

#pragma - 晒单是用这个抠的
+ (UIImage *)cropImage:(UIImage *)image targetRect:(CGRect)targetRect
{
    targetRect.origin.x *= image.scale;
    targetRect.origin.y *= image.scale;
    targetRect.size.width *= image.scale;
    targetRect.size.height *= image.scale;
    
    if (targetRect.origin.x < 0) {
        targetRect.origin.x = 0;
    }
    if (targetRect.origin.y < 0) {
        targetRect.origin.y = 0;
    }
    
    //宽度高度过界就删去
    CGFloat cgWidth = CGImageGetWidth(image.CGImage);
    CGFloat cgHeight = CGImageGetHeight(image.CGImage);
    if (CGRectGetMaxX(targetRect) > cgWidth) {
        targetRect.size.width = cgWidth - targetRect.origin.x;
    }
    if (CGRectGetMaxY(targetRect) > cgHeight) {
        targetRect.size.height = cgHeight - targetRect.origin.y;
    }
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, targetRect);
    UIImage *resultImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    //修正回原scale和方向
    resultImage = [UIImage imageWithCGImage:resultImage.CGImage scale:image.scale orientation:image.imageOrientation];
    
    return resultImage;
}


/*
 *  图片旋转
 */
+ (UIImage *)rotateImageWithRadian:(CGFloat)radian cropMode:(SvCropMode)cropMode image:(UIImage *)image
{
    CGImageRef imgRef = [image CGImage];
    // 1. 转换CGImage并使用对应的CGImage尺寸
    CGSize imgSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
    CGSize outputSize = imgSize;
    if (cropMode == enSvCropExpand) {
        CGRect rect = CGRectMake(0, 0, imgSize.width, imgSize.height);
        rect = CGRectApplyAffineTransform(rect, CGAffineTransformMakeRotation(radian));
        outputSize = CGSizeMake(CGRectGetWidth(rect), CGRectGetHeight(rect));
    }
    
    UIGraphicsBeginImageContext(outputSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, outputSize.width / 2, outputSize.height / 2);
    CGContextRotateCTM(context, radian);
    CGContextTranslateCTM(context, -imgSize.width / 2, -imgSize.height / 2);
    
    [image drawInRect:CGRectMake(0, 0, imgSize.width, imgSize.height)];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}


#pragma mark - 先留着
/**
 *  "下一步"的抠图操作
 */
//- (UIImage *)cropImage
//{
//    //不稳定下来，不让动
//    if (self.photoView.scrollView.tracking || self.photoView.scrollView.dragging || self.photoView.scrollView.decelerating || self.photoView.scrollView.zoomBouncing || self.photoView.scrollView.zooming){
//        return nil;
//    }
//    else
//    {
//        //根据区域来截图
//        CGPoint startPoint = [self.photoView convertPoint:CGPointZero toView:self.photoView.imageView];
//        CGPoint maxPoint = CGPointMake(CGRectGetMaxX(self.photoView.bounds), CGRectGetMaxY(self.photoView.bounds));
//        CGPoint endPoint = [self.photoView convertPoint:maxPoint toView:self.photoView.imageView];
//        
//        //这里获取的是实际宽度和zoomScale为1的frame宽度的比例
//        CGFloat wRatio = self.photoView.imageView.image.size.width / (self.photoView.imageView.frame.size.width / self.photoView.scrollView.zoomScale);
//        CGFloat hRatio = self.photoView.imageView.image.size.height / (self.photoView.imageView.frame.size.height / self.photoView.scrollView.zoomScale);
//        CGRect cropRect = CGRectMake(startPoint.x * wRatio, startPoint.y * hRatio, (endPoint.x - startPoint.x) * wRatio, (endPoint.y - startPoint.y) * hRatio);
//        
//        return [UIImage cropImage:self.photoView.imageView.image targetRect:cropRect];
//    }
//}


- (UIImage *)imageWithScreenWidthScale:(UIImage *)image
{
    if (image.size.width < 650) {
        return image;
    }
    
    CGFloat ratio = image.size.width / image.size.height;
    CGSize imgSize = CGSizeMake(650, 650 / ratio);
    
    // 创建一个 bitmap context
    UIGraphicsBeginImageContextWithOptions(imgSize, YES, [[UIScreen mainScreen] scale]);
    
    // 将图片绘制到当前的 context 上
    [image drawInRect:CGRectMake(0, 0, imgSize.width, imgSize.height) blendMode:kCGBlendModeNormal alpha:1.0];
    
    // 从当前 context 中获取刚绘制的图片
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}


@end
