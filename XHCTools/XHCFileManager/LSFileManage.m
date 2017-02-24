//
//  LSFileManage.m
//  redlips
//
//  Created by zizp on 15/10/23.
//  Copyright © 2015年 xiaohongchun. All rights reserved.
//

#import "LSFileManage.h"

@implementation LSFileManage

/*** 获取应用沙盒根路径 ***/
+ (NSString *)getDirHomePath
{
    return NSHomeDirectory();
}

/*** 获取 Documents 目录路径 ***/
+ (NSString *)getDocumentsPath
{
    //第1种方法
    //NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    //第2种方法
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

/*** 获取 Library 目录路径 ***/
+ (NSString *)getLibraryPath
{
    //第1种方法
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
    //第2种方法
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    return libraryDirectory;
}

/*** 获取 Cache 目录路径 ***/
+ (NSString *)getCachePath
{
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacPath objectAtIndex:0];
    return cachePath;
}

/*** 获取 Tmp 目录路径 ***/
+ (NSString *)getTmpPath
{
    //第1种方法
    //[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    //第2种方法
    NSString *tmpDirectory = NSTemporaryDirectory();
    return tmpDirectory;
}


/*** Cache 目录下，创建 folderName 文件夹(目录) ***/
+ (NSString *)createCachePathWithFolderName:(NSString *)folderName
{
    NSString *documentsPath = [LSFileManage getCachePath];
    NSString *folderDirectory = [documentsPath stringByAppendingPathComponent:folderName]; //eg:@"test"
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:folderDirectory]) {
        NSLog(@"%@ 文件夹已存在", folderName);
        return folderDirectory;
    }
    //创建目录
    NSError *error = nil;
    BOOL result = [fileManager createDirectoryAtPath:folderDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    if (result) {
        NSLog(@"%@ 文件夹创建成功", folderName);
        return folderDirectory;
    }
    else {
        NSLog(@"%@ 文件夹创建失败, 错误：%@", folderName, error);
        return nil;
    }
}

+ (NSString *)saveDataToFolder:(NSString *)folder fileName:(NSString *)fileName data:(NSData *)data
{
    NSString *folderPath = [LSFileManage createCacheDirectorWithFolderName:folder];
    
    NSString *filePath = nil;
    if (!folderPath) { //如果文件夹路径为空，默认保存在 Documents 目录下
        //filePath = [cachePath stringByAppendingPathComponent:fileName];
        fileName = @"test";
    }
    else {
        filePath = [folderPath stringByAppendingPathComponent:fileName];
        //filePath = [folderDirectory stringByAppendingPathComponent:fileName];
    }
    
    BOOL flag = [data writeToFile:filePath atomically:NO];
    if (flag) {
        NSLog(@"%@ 图片保存到 %@ 目录成功", fileName, filePath);
        return filePath;
    }
    else {
        NSLog(@"%@ 图片保存到 %@ 目录失败", fileName, filePath);
        return nil;
    }
}

/*** 到 Caches 下指定文件夹里读取图片 ***/
+ (UIImage *)readCacheDirectorImageWithFolderName:(NSString *)folderName ImageName:(NSString *)imageName
{
    NSString *documentsPath = [LSFileManage getCachePath];
    NSString *folderDirectory = [documentsPath stringByAppendingPathComponent:folderName]; //eg:@"test"
    NSString *imagePath = [folderDirectory stringByAppendingPathComponent:imageName];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    //NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
    //UIImage *image = [UIImage imageWithData:imageData];
//    if (!stringIsEmpty(imagePath)) {
//        NSLog(@"%@ 图片读取成功", imagePath);
//        return imagePath;
//    }
//    else {
//        NSLog(@"%@ 图片读取失败", imagePath);
//        return nil;
//    }
    if (image) {
        NSLog(@"%@ 图片读取成功", imageName);
        return image;
    }
    else {
        NSLog(@"%@ 图片读取失败", imageName);
        return nil;
    }

}


/*** Caches 目录下，创建 folderName 文件夹(目录) ***/
+ (NSString *)createCacheDirectorWithFolderName:(NSString *)folderName
{
    NSString *cachePath = [LSFileManage getCachePath];
    NSString *folderDirectory = [cachePath stringByAppendingPathComponent:folderName]; //eg:@"test"
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:folderDirectory]) {
        NSLog(@"%@ 文件夹已存在", folderName);
        return folderDirectory;
    }
    //创建目录
    NSError *error = nil;
    BOOL result = [fileManager createDirectoryAtPath:folderDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    if (result) {
        NSLog(@"%@ 文件夹创建成功", folderName);
        return folderDirectory;
    }
    else {
        NSLog(@"%@ 文件夹创建失败, 错误：%@", folderName, error);
        return nil;
    }
}



/*** Documents 目录下，创建 folderName 文件夹(目录) ***/
+ (NSString *)createDirectorWithFolderName:(NSString *)folderName
{
    NSString *documentsPath = [LSFileManage getDocumentsPath];
    NSString *folderDirectory = [documentsPath stringByAppendingPathComponent:folderName]; //eg:@"test"
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:folderDirectory]) {
        NSLog(@"%@ 文件夹已存在", folderName);
        return folderDirectory;
    }
    //创建目录
    NSError *error = nil;
    BOOL result = [fileManager createDirectoryAtPath:folderDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    if (result) {
        NSLog(@"%@ 文件夹创建成功", folderName);
        return folderDirectory;
    }
    else {
        NSLog(@"%@ 文件夹创建失败, 错误：%@", folderName, error);
        return nil;
    }
}

/*** Documents 目录下, folderName 文件夹(目录)下 新建文件 fileName ***/
+ (NSString *)createFileWithFolderName:(NSString *)folderName AndFileName:(NSString *)fileName
{
    NSString *documentsPath = [LSFileManage getDocumentsPath];
    NSString *folderDirectory = [documentsPath stringByAppendingPathComponent:folderName]; //eg:@"test"
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [folderDirectory stringByAppendingPathComponent:fileName]; //eg:@"test.txt"
    BOOL result = [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    if (result) {
        NSLog(@"%@ 文件创建成功", fileName);
        return filePath;
    }
    else {
        NSLog(@"%@ 文件创建失败", fileName);
        return nil;
    }
}

/*** 写数据到文件 ***/
+ (BOOL)writeToFileWithFolderName:(NSString *)folderName FileName:(NSString *)fileName AndContentString:(NSString *)content
{
    NSString *documentsPath = [LSFileManage getDocumentsPath];
    NSString *folderDirectory = [documentsPath stringByAppendingPathComponent:folderName]; //eg:@"test"
    NSString *filePath = [folderDirectory stringByAppendingPathComponent:fileName];      //eg:@"test.txt"
    NSError *error = nil;
    BOOL result = [content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (result) {
        NSLog(@"%@ 文件写入成功", content);
        return YES;
    }
    else {
        NSLog(@"%@ 文件写入失败 错误: %@", content, error);
        return NO;
    }
}

/*** 读取文件 ***/
- (NSString *)readFileWithFolderName:(NSString *)folderName FileName:(NSString *)fileName
{
    NSString *documentsPath = [LSFileManage getDocumentsPath];
    NSString *folderDirectory = [documentsPath stringByAppendingPathComponent:folderName]; //eg:@"test"
    NSString *filePath = [folderDirectory stringByAppendingPathComponent:fileName];      //eg:@"test.txt"
    //NSData *data = [NSData dataWithContentsOfFile:testPath];
    //NSLog(@"文件读取成功: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    NSError *error = nil;
    NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"%@ 文件读取失败，错误: %@", content, error);
    }
    else {
        NSLog(@"%@ 文件读取成功",content);
    }
    
    return content;
}

/*** 保存文件到 Documents 下指定文件夹里 ***/
+ (BOOL)saveDataToPathName:(NSString *)pathName WithData:(NSData *)data
{
    if (data != nil && pathName) {
        //BOOL flag = [data writeToFile:pathName options:NSDataWritingAtomic error:nil];
        BOOL flag = [data writeToFile:pathName atomically:NO];
        if (flag) {
            NSLog(@"数据保存到 %@ 目录成功", pathName);
            return YES;
        }
        else {
            NSLog(@"数据保存到 %@ 目录失败", pathName);
            return NO;
        }
    }
    else {
        NSLog(@"******* 要保存的数据为空 *******");
        return NO;
    }
}

/*** 保存文件到 Documents 下指定文件夹里 ***/
+ (NSString *)saveDataToFolderName:(NSString *)folderName WithData:(NSData *)data
{
    if (data != nil) {
        NSString *documentsPath = [LSFileManage getDocumentsPath];
        NSString *filePath = [documentsPath stringByAppendingPathComponent:folderName];
        BOOL flag = [data writeToFile:filePath atomically:NO];
        if (flag) {
            NSLog(@"数据保存到 %@ 目录成功", filePath);
            return filePath;
        }
        else {
            NSLog(@"数据保存到 %@ 目录失败", filePath);
            return nil;
        }
    }
    else {
        NSLog(@"******* 要保存的数据为空 *******");
        return nil;
    }
}

/*** 到 Documents 下指定文件夹里读取图片 ***/
+ (NSString *)readImageWithFolderName:(NSString *)folderName ImageName:(NSString *)imageName
{
    NSString *documentsPath = [LSFileManage getDocumentsPath];
    NSString *folderDirectory = [documentsPath stringByAppendingPathComponent:folderName]; //eg:@"test"
    NSString *imagePath = [folderDirectory stringByAppendingPathComponent:imageName];
    //UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    //NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
    //UIImage *image = [UIImage imageWithData:imageData];
    if (imagePath) {
        NSLog(@"%@ 图片读取成功", imagePath);
        return imagePath;
    }
    else {
        NSLog(@"%@ 图片读取失败", imagePath);
        return nil;
    }
}

/*** 获取文件属性 ***/
/**
 返回值包含信息：
 eg:
 {
 NSFileCreationDate = "2013-03-26 03:03:26 +0000";
 NSFileExtendedAttributes =     {
 "com.apple.TextEncoding" = <7574662d 383b3133 34323137 393834>;
 };
 NSFileExtensionHidden = 0;
 NSFileGroupOwnerAccountID = 20;
 NSFileGroupOwnerAccountName = staff;
 NSFileHFSCreatorCode = 0;
 NSFileHFSTypeCode = 0;
 NSFileModificationDate = "2013-03-26 03:03:58 +0000";
 NSFileOwnerAccountID = 501;
 NSFileOwnerAccountName = hehehe;
 NSFilePosixPermissions = 420;
 NSFileReferenceCount = 1;
 NSFileSize = 19;
 NSFileSystemFileNumber = 3145017;
 NSFileSystemNumber = 16777225;
 NSFileType = NSFileTypeRegular;
 }
 **/
+ (NSDictionary *)fileAttriutesWithFolderName:(NSString *)folderName FileName:(NSString *)fileName
{
    NSString *documentsPath = [LSFileManage getDocumentsPath];
    NSString *folderDirectory = [documentsPath stringByAppendingPathComponent:folderName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [folderDirectory stringByAppendingPathComponent:fileName];
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:filePath error:nil];
    return fileAttributes;
}

/*** 获取文件大小 ***/
+ (double)getFileSizeAtPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    NSDictionary *ret = [fileManager attributesOfItemAtPath:path error:&error];
    if(error) {
        NSLog(@"获取文件属性失败 错误：%@", error);
    }
    return [[ret objectForKey:NSFileSize] doubleValue];
}

/*** 获取文件夹的大小 ***/
+ (double)getDirectorySizeAtPath:(NSString *)path
{
    double directorySize = 0;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:path error:NULL];
    NSEnumerator *e = [contents objectEnumerator];
    NSString *fileName;
    
    while (fileName = [e nextObject]) {
        NSString *filePath = [path stringByAppendingPathComponent:fileName];
        
        BOOL isDir = NO;
        BOOL isExit = [fileManager fileExistsAtPath:filePath isDirectory:&isDir];
        if (isExit) {
            if (isDir) {
                directorySize += [self getDirectorySizeAtPath:filePath];
            }
            else {
                double size = [LSFileManage getFileSizeAtPath:filePath];
                directorySize += size;
            }
        }
    }
    
    return directorySize;
}

/*** 是否存在指定文件 ***/
+ (BOOL)isExistFileAtPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:path];
}

/*** 删除指定路径的文件 ***/
+ (BOOL)deleteFileAtPath:(NSString *)path
{
    BOOL isExist = [LSFileManage isExistFileAtPath:path];
    if (isExist) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *error = nil;
        BOOL result = [fileManager removeItemAtPath:path error:&error];
        if (result) {
            NSLog(@"删除文件成功");
            return YES;
        }
        else {
            NSLog(@"删除文件失败：%@", error);
            return NO;
        }
    }
    else {
        NSLog(@"该文件不存在 %@", path);
        return NO;
    }
}

/*** 删除指定路径文件夹下的所有文件 ***/
+ (BOOL)deleteAllFileFromFolderPath:(NSString *)folderPath
{
    BOOL isExist = [LSFileManage isExistFileAtPath:folderPath];
    if (isExist) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *error = nil;
        NSArray *contents = [fileManager contentsOfDirectoryAtPath:folderPath error:NULL];
        NSEnumerator *e = [contents objectEnumerator];
        NSString *fileName;
        while (fileName = [e nextObject]) {
            NSString *filePath = [folderPath stringByAppendingPathComponent:fileName];
            BOOL result = [fileManager removeItemAtPath:filePath error:&error];
            if (result) {
                NSLog(@"删除 %@ 文件成功", fileName);
            }
            else {
                NSLog(@"删除 %@ 文件失败：%@", fileName, error);
                return NO;
            }
        }
        return YES;
    }
    else {
        NSLog(@"该文件夹不存在 %@", folderPath);
        return YES;
    }
}

/**
 *  获取文件中MP4文件的大小
 *
 *  @param folderPath 文件路径
 *
 *  @return 文件大小
 */
+ (double)folderMP4SizeAtPath:(NSString *)folderPath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        if([[fileName pathExtension] isEqualToString:@"mp4"]){
            long long fileSize = [self getFileSizeAtPath:fileAbsolutePath];
            folderSize += fileSize;
        }
    }
    return folderSize/(1024.0*1024.0);
}
/**
 *  删除指定文件中的MP4文件
 *
 *  @param folderPath 文件路径
 *
 *  @return void
 */
+ (void)deleteFolderMP4SizeAtPath:(NSString *)folderPath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return ;
    NSEnumerator *childFilesEnumerator = [[manager contentsOfDirectoryAtPath:folderPath error:nil] objectEnumerator];
    NSString* fileName;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        if([[fileName pathExtension] isEqualToString:@"mp4"]){
            
            [LSFileManage deleteFileAtPath:fileAbsolutePath];
        }
    }
}

/**
 打印出所有文件的路径和大小
 */
+ (void)logAllFileAndSize
{
    NSString *documentsPath = [LSFileManage getDocumentsPath];
    NSString *cachesPath = [LSFileManage getCachePath];
    NSString *tmpPath = [LSFileManage getTmpPath];
    NSArray *array = @[documentsPath, cachesPath, tmpPath];
    
    for (NSString *doucumentsPath in array) {
        _logFilesInfo(doucumentsPath);
    }
}

void _logFilesInfo(NSString *path)
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:path error:NULL];
    NSEnumerator *e = [contents objectEnumerator];
    NSString *fileName;
    
    while (fileName = [e nextObject]) {
        NSString *filePath = [path stringByAppendingPathComponent:fileName];
        
        BOOL isDir = NO;
        BOOL isExit = [fileManager fileExistsAtPath:filePath isDirectory:&isDir];
        if (isExit) {
            if (isDir) {
                _logFilesInfo(filePath);
            }
            else {
                double size = [LSFileManage getFileSizeAtPath:filePath];
                NSLog(@"fileName = %@, size = %lf", filePath, size);
            }
        }
    }
}


@end
