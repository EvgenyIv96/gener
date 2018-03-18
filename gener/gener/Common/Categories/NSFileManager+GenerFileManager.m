//
//  NSFileManager+GenerFileManager.m
//  gener
//
//  Created by Tatiana Bocharnikova on 18.03.2018.
//  Copyright © 2018 GNR. All rights reserved.
//

#import "NSFileManager+GenerFileManager.h"

@implementation NSFileManager (GenerFileManager)

+ (NSString *)findJSONFileInDirecory:(NSString *)directoryPath {
    
    NSArray* dirs = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:nil];
    
    __block NSString *result;
    
    [dirs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        NSString *filename = (NSString *)obj;
        NSString *extension = [[filename pathExtension] lowercaseString];
        
        if ([extension isEqualToString:@"json"]) {
            
            result = [directoryPath stringByAppendingPathComponent:filename];
            *stop = YES;
        }
    }];
    
    return result;
}


@end
