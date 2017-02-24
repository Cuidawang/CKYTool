//
//  UIView+AligmentRectInsets.h
//  XHCReactiveCocoaDemo
//
//  Created by Cuikeyi on 2016/11/27.
//  Copyright © 2016年 xiaohongchun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIEdgeInsets(^XHCAlignmentRectInsets)();

@interface UIView (AligmentRectInsets)

/**
 实现这个Block，可以将视图间的间距算到视图的内容中
 */
@property (nonatomic, copy) XHCAlignmentRectInsets xhcAlignmentRectInsetsBlock;

@end
