//
//  UIImage+InternalMethod.m
//  910Helper
//
//  Created by zizp on 14-10-10.
//  Copyright (c) 2014年 Lucky_Truda. All rights reserved.
//

#import "UIImage+InternalMethod.h"

@implementation UIImage (InternalMethod)

- (UIImage*)imageRotatedByDegrees:(CGFloat)degrees
{
    CGSize rotatedSize = self.size;
    
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    CGContextRotateCTM(bitmap, degrees * M_PI / 180);
    CGContextRotateCTM(bitmap, M_PI);
    CGContextScaleCTM(bitmap, -1.0, 1.0);
    CGContextDrawImage(bitmap, CGRectMake(-rotatedSize.width/2, -rotatedSize.height/2, rotatedSize.width, rotatedSize.height), self.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)imageRotatedByrotation:(UIImageOrientation)orientation
{
    long double rotate = 0.0;
    CGRect rect;
    float translateX = 0;
    float translateY = 0;
    float scaleX = 1.0;
    float scaleY = 1.0;
    
    switch (orientation) {
        case UIImageOrientationLeft:
            rotate = M_PI_2;
            rect = CGRectMake(0, 0, self.size.height, self.size.width);
            translateX = 0;
            translateY = -rect.size.width;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationRight:
            rotate = 3 * M_PI_2;
            rect = CGRectMake(0, 0, self.size.height, self.size.width);
            translateX = -rect.size.height;
            translateY = 0;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationDown:
            rotate = M_PI;
            rect = CGRectMake(0, 0, self.size.width, self.size.height);
            translateX = -rect.size.width;
            translateY = -rect.size.height;
            break;
        default:
            rotate = 0.0;
            rect = CGRectMake(0, 0, self.size.width, self.size.height);
            translateX = 0;
            translateY = 0;
            break;
    }
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //做CTM变换
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextRotateCTM(context, rotate);
    CGContextTranslateCTM(context, translateX, translateY);
    
    CGContextScaleCTM(context, scaleX, scaleY);
    //绘制图片
    CGContextDrawImage(context, CGRectMake(0, 0, rect.size.width, rect.size.height), self.CGImage);
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    
    return newPic;
}

+ (UIImage *)rowActionImageWithtitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor image:(UIImage *)image forCellHeight:(CGFloat)cellHeight;
{
    CGFloat titleMultiplier = 1.2;
    CGFloat fontSize_iOS8AndUpDefault = 18.f;
    CGFloat fontSize_actuallyUsedUnderImage = 12.f;
    CGFloat margin_horizontal_iOS8AndUp = 15.f;
    CGFloat margin_vertical_betweenTextAndImage = cellHeight>=64.0f ? 2.0f : 2.0f;
    
    NSString *titleSpaceString= [@"" stringByPaddingToLength:[title length]*titleMultiplier withString:@"\u3000" startingAtIndex:0];
    CGSize frameGuess=CGSizeMake((margin_horizontal_iOS8AndUp*2)+[titleSpaceString boundingRectWithSize:CGSizeMake(MAXFLOAT, cellHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName: [UIFont systemFontOfSize:fontSize_iOS8AndUpDefault] } context:nil].size.width, cellHeight);
    
    CGSize tripleFrame=CGSizeMake(frameGuess.width*3.0f, frameGuess.height*3.0f);
    
    UIGraphicsBeginImageContextWithOptions(tripleFrame, YES, [[UIScreen mainScreen] scale]);
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    [backgroundColor set];
    CGContextFillRect(context, CGRectMake(0, 0, tripleFrame.width, tripleFrame.height));
    
    CGSize drawnTextSize=[title boundingRectWithSize:CGSizeMake(MAXFLOAT, cellHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName: [UIFont systemFontOfSize:fontSize_actuallyUsedUnderImage] } context:nil].size;
    
    [image drawAtPoint:CGPointMake((frameGuess.width/2.0f)-([image size].width/2.0f), (frameGuess.height/2.0f)-[image size].height-(margin_vertical_betweenTextAndImage/2.0f)+2.0f)];
    [title drawInRect:CGRectMake(((frameGuess.width/2.0f)-(drawnTextSize.width/2.0f))*([[UIApplication sharedApplication] userInterfaceLayoutDirection]==UIUserInterfaceLayoutDirectionRightToLeft ? -1 : 1), (frameGuess.height/2.0f)+(margin_vertical_betweenTextAndImage/2.0f)+2.0f, frameGuess.width, frameGuess.height) withAttributes:@{ NSFontAttributeName: [UIFont systemFontOfSize:fontSize_actuallyUsedUnderImage], NSForegroundColorAttributeName: titleColor }];
    UIImage *ala = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return ala;
}

@end
