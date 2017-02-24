//
//  LSFileManage.h
//  redlips
//
//  Created by zizp on 15/10/23.
//  Copyright © 2015年 xiaohongchun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LSFileManage : NSObject

/**------------------- FileManage methods -------------------**/


/**
*  获取应用沙盒根路径
*/
+ (NSString *)getDirHomePath;


/**
 *  获取 Documents 目录路径
 */
+ (NSString *)getDocumentsPath;

/**
 *  获取 Library 目录路径
 */
+ (NSString *)getLibraryPath;

/**
 *  获取 Cache 目录路径
 */
+ (NSString *)getCachePath;

/**
 *  获取 Tmp 目录路径
 */
+ (NSString *)getTmpPath;

/**
 *  Cache 目录下，创建 folderName 文件夹(目录)
 *
 *  @param folderName 文件夹名字
 *
 *  @return folderName目录的路径
 */
+ (NSString *)createCachePathWithFolderName:(NSString *)folderName;

/**
 *  保存到 Cache 目录下
 *
 *  @param imageName 文件夹名字
 *  @param data 保存的数据
 *  @param path 目录的路径
 *  return 是否成功
 */
+ (NSString *)saveDataToFolder:(NSString *)folder fileName:(NSString *)fileName data:(NSData *)data;

/*** 到 Caches 下指定文件夹里读取图片 ***/

/**
 到 Caches 下指定文件夹里读取图片

 @param folderName 文件夹名字
 @param imageName  文件名字

 @return 图片
 */
+ (UIImage *)readCacheDirectorImageWithFolderName:(NSString *)folderName ImageName:(NSString *)imageName;

/**
 *  Documents 目录下，创建 folderName 文件夹(目录)
 *
 *  @param folderName 文件夹名字
 *
 *  @return folderName目录的路径
 */
+ (NSString *)createDirectorWithFolderName:(NSString *)folderName;

/**
 *  Documents 目录下, folderName 文件夹(目录)下 新建文件 fileName
 *
 *  @param folderName 文件夹名字
 *  @param fileName   文件名字
 *
 *  @return fileName 文件的路径
 */
+ (NSString *)createFileWithFolderName:(NSString *)folderName AndFileName:(NSString *)fileName;

/**
 *  写数据到文件
 *
 *  @param folderName 文件夹名字
 *  @param fileName   文件名字
 *  @param content    要写的内容
 *
 *  @return 是否写入成功
 */
+ (BOOL)writeToFileWithFolderName:(NSString *)folderName FileName:(NSString *)fileName AndContentString:(NSString *)content;

/**
 *  按文件夹和文件名字 读取文件
 *
 *  @param folderName 文件夹名字
 *  @param fileName   文件名字
 *
 *  @return 文件路径
 */
- (NSString *)readFileWithFolderName:(NSString *)folderName FileName:(NSString *)fileName;

/**
 *  保存文件到指定路径下
 *
 *  @param pathName 路径
 *  @param data     要保存的数据
 *
 *  @return 是否保存成功
 */
+ (BOOL)saveDataToPathName:(NSString *)pathName WithData:(NSData *)data;

/**
 *  保存文件到 Caches 下指定文件夹里
 *
 *  @param folderName 文件夹名字
 *  @param data       保存的数据
 *
 *  @return 文件夹路径
 */
+ (NSString *)saveDataToFolderName:(NSString *)folderName WithData:(NSData *)data;

/**
 *  到 Documents 下指定文件夹里读取图片
 *
 *  @param folderName 指定文件夹
 *  @param imageName  图片名字
 *
 *  @return 文件路径
 */
+ (NSString *)readImageWithFolderName:(NSString *)folderName ImageName:(NSString *)imageName;

/**
 *  获取文件属性
 *
 *  @param folderName 文件夹名字
 *  @param fileName   文件名字
 *
 *  @return 文件信息
 */
+ (NSDictionary *)fileAttriutesWithFolderName:(NSString *)folderName FileName:(NSString *)fileName;

/**
 *  获取文件大小
 *
 *  @param path 文件路径
 *
 *  @return 文件大小
 */
+ (double)getFileSizeAtPath:(NSString *)path;

/**
 *  获取文件夹的大小
 *
 *  @param path 文件路径
 *
 *  @return 文件大小
 */
+ (double)getDirectorySizeAtPath:(NSString *)path;

/**
 *  是否存在指定文件
 *
 *  @param path 文件路径
 *
 *  @return 是否存在
 */
+ (BOOL)isExistFileAtPath:(NSString *)path;

/**
 *  删除指定路径的文件
 *
 *  @param path 文件路径
 *
 *  @return 是否删除成功
 */
+ (BOOL)deleteFileAtPath:(NSString *)path;

/**
 *  删除指定路径文件夹下的所有文件
 *
 *  @param folderPath 文件夹名字
 *
 *  @return 是否删除成功
 */
+ (BOOL)deleteAllFileFromFolderPath:(NSString *)folderPath;

/**
 *  获取文件中MP4文件的大小
 *
 *  @param folderPath 文件路径
 *
 *  @return 文件大小
 */
+ (double)folderMP4SizeAtPath:(NSString *)folderPath;

/**
 *  删除指定文件中的MP4文件
 *
 *  @param folderPath 文件路径
 *
 *  @return void
 */
+ (void)deleteFolderMP4SizeAtPath:(NSString *)folderPath;

/**
 打印出所有文件的路径和大小
 */
+ (void)logAllFileAndSize;

@end
