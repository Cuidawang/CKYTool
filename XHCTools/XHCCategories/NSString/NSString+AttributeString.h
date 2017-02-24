//
//  NSString+AttributeString.h
//  redlips
//
//  Created by iTruda on 27/4/16.
//  Copyright © 2016年 xiaohongchun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (AttributeString)

/**
 *  获取子字符串所在位置
 *
 *  @param substring 子串
 *
 *  @return range
 */
- (NSRange)stringRangeOfSubstring:(NSString *)substring;

/**
 *  获取一个 NSAttributedString
 *
 *  @param font       字体大小
 *  @param baseColor  字体基本颜色
 *  @param rangeColor 字体范围颜色
 *  @param range      范围
 *
 *  @return NSAttributedString
 */
- (NSAttributedString *)stringFont:(UIFont *)font baseColor:(UIColor *)baseColor rangeColor:(UIColor *)rangeColor range:(NSRange)range lineSpacing:(CGFloat)lineSpacing;


@end


/*

 //1.  设置字体
 NSFontAttributeName : [UIFont systemFontOfSize:_fontSize]
 
 //2.  设置文字颜色
 NSForegroundColorAttributeName : [UIColor redColor]
 
 //3.  设置背景颜色
 NSBackgroundColorAttributeName : [UIColor blackColor]
 
 //4.  设置段落样式 (取值为 NSParagraphStyle 对象)
 NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
 paragraph.alignment = NSTextAlignmentCenter;
 paragraph.lineSpacing = 3.f;
 NSParagraphStyleAttributeName : paragraph
 
 //5.  设置文字描边颜色
 NSStrokeColorAttributeName，需要和 NSStrokeWidthAttributeName 设置描边宽度使用，这样就能使文字空心.
 
 //6.  设置描边宽度  (负值填充效果，正值中空效果)
 NSStrokeWidthAttributeName 
 ***  ----  ***
 NSStrokeWidthAttributeName 这个属性所对应的值是一个 NSNumber 对象(小数)。该值改变描边宽度（相对于字体size 的百分比）。默认为 0，即不改变。正数只改变描边宽度。负数同时改变文字的描边和填充宽度。例如，对于常见的空心字，这个值通常为3.0。
 同时设置了空心的两个属性，并且NSStrokeWidthAttributeName属性设置为正数，文字前景色就无效果了
 ***  ----  ***
 
 //7.  添加删除线
 NSStrikethroughStyleAttributeName : NSUnderlineStyleSingle
 
 //8.  添加下划线 (枚举常量 NSUnderlineStyle 中的值，与删除线类似)
 NSUnderlineStyleAttributeName : NSUnderlineStyleSingle
 
 //9.  设置阴影 (单独设置不好使，必须和其他属性搭配才好使, 取值为 NSShadow 对象)
 NSShadowAttributeName
 和这三个任一个都好使，NSVerticalGlyphFormAttributeName，NSObliquenessAttributeName，NSExpansionAttributeName
 NSVerticalGlyphFormAttributeName : @0
 该属性所对应的值是一个 NSNumber 对象(整数)。@0 表示横排文本。@1 表示竖排文本。在 iOS 中，总是使用横排文本，0 以外的值都未定义。
 
 //10. 设置字符间距 (取值为 NSNumber 对象（整数），正值间距加宽，负值间距变窄)
 NSKernAttributeName : @5
 
 //11. 设置设置字体倾斜 (Skew 斜  取值为 NSNumber（float）,正值右倾，负值左倾)
 NSObliquenessAttributeName : @1
 
 //12. 设置文本扁平化 (设置文本横向拉伸属性，取值为 NSNumber（float）,正值横向拉伸文本，负值横向压缩文本)
 NSExpansionAttributeName : @1
 
 //13. 设置基线偏移值 (取值为 NSNumber（float）,正值上偏，负值下偏)
 NSBaselineOffsetAttributeName

 //14. 设置文字书写方向 (从左向右书写或者从右向左书写)
 NSWritingDirectionAttributeName
 
 //15. 设置文字排版方向 (取值为 NSNumber 对象(整数)，0 表示横排文本，1 表示竖排文本)
 NSVerticalGlyphFormAttributeName
 
 //16. 设置链接属性 (点击后调用浏览器打开指定URL地址)
  NSLinkAttributeName
 
 //17. 设置文本附件 (取值为 NSTextAttachment 对象, 常用于文字图片混排)
 NSAttachmentAttributeName
 
*/





