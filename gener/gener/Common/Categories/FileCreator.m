//
//  FileCreator.m
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import "FileCreator.h"
#import "SourceFile.h"

@implementation FileCreator

#pragma mark - Public

- (void)createFilesFromArray:(NSArray *)templates error:(NSError **)error {

    for (SourceFile *file in templates) {
        [self createFile:file error:nil];
    }
}

#pragma mark - Private

- (void)createFile:(SourceFile *)file error:(NSError *)error {

    if (![[NSFileManager defaultManager] fileExistsAtPath:[file destinationPath]]) {

        NSError *folderCreationError;

        [[NSFileManager defaultManager] createDirectoryAtPath:[file destinationPath] withIntermediateDirectories:YES attributes:nil error:&folderCreationError];
    }

    NSString *filePath = [NSString stringWithFormat:@"%@/%@%@", [file destinationPath], [file name], [file extention]];
    NSString *fileContent = [file content];
    NSData *content = [fileContent dataUsingEncoding:NSUTF8StringEncoding];

    [[NSFileManager defaultManager] createFileAtPath:filePath contents:content attributes:nil];

}

@end
