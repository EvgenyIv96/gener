//
//  FileCreator.m
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import "FileCreator.h"
#import "SourceFile.h"

@interface FileCreator ()

@property (strong, nonatomic) NSFileManager *fileManager;

@end

@implementation FileCreator

#pragma mark - Initializer

- (instancetype)init {
    self = [super init];
    if (self) {
        _fileManager = [NSFileManager defaultManager];
    }
    return self;
}

#pragma mark - Public

- (void)createFilesFromArray:(NSArray *)templates error:(NSError **)error {

    for (SourceFile *file in templates) {
        [self createFile:file error:nil];
    }
}

#pragma mark - Private

- (void)createFile:(SourceFile *)file error:(NSError *)error {

    if (![self.fileManager fileExistsAtPath:[file destinationPath]]) {

        NSError *folderCreationError;

        [self.fileManager createDirectoryAtPath:[file destinationPath] withIntermediateDirectories:YES attributes:nil error:&folderCreationError];
    }

    NSString *filePath = [NSString stringWithFormat:@"%@/%@%@", [file destinationPath], [file name], [file extention]];
    NSString *fileContent = [file content];
    NSData *content = [fileContent dataUsingEncoding:NSUTF8StringEncoding];

    [self.fileManager createFileAtPath:filePath contents:content attributes:nil];

}

@end
