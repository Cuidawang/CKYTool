//
//  UIView+AligmentRectInsets.m
//  XHCReactiveCocoaDemo
//
//  Created by Cuikeyi on 2016/11/27.
//  Copyright © 2016年 xiaohongchun. All rights reserved.
//

#import "UIView+AligmentRectInsets.h"

#import <objc/runtime.h>

@implementation UIView (AligmentRectInsets)
@dynamic xhcAlignmentRectInsetsBlock;

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [self class];
        SEL originalSelector = @selector(alignmentRectInsets);
        SEL swizzledSelector = @selector(XHC_AlignmentRectInsets);
        
        Method originalMethod = class_getInstanceMethod(cls, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }
        else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (UIEdgeInsets)XHC_AlignmentRectInsets
{
    if (self.xhcAlignmentRectInsetsBlock) {
        return self.xhcAlignmentRectInsetsBlock();
    }
    else {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}

- (void)setXhcAlignmentRectInsetsBlock:(XHCAlignmentRectInsets)xhcAlignmentRectInsetsBlock
{
    objc_setAssociatedObject(self, @"XHCAlignmentRectInsets", xhcAlignmentRectInsetsBlock, OBJC_ASSOCIATION_COPY);
}

- (XHCAlignmentRectInsets)xhcAlignmentRectInsetsBlock
{
    return objc_getAssociatedObject(self, @"XHCAlignmentRectInsets");
}

@end
