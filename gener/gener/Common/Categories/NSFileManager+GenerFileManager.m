//
//  NSFileManager+GenerFileManager.m
//  gener
//
//  Created by Tatiana Bocharnikova on 18.03.2018.
//  Copyright © 2018 GNR. All rights reserved.
//

#import "NSFileManager+GenerFileManager.h"

#import "ModuleSettings.h"

@implementation NSFileManager (GenerFileManager)

#pragma mark - Public

+ (NSString *)findJSONFileInDirecory:(NSString *)directoryPath forSelectedLanguage:(Language)language {
    
    NSArray* dirs = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:nil];
    
    NSString *result;
    
    NSString *fileName = [self templateJSONNameForLanguage:language];
    
    result = [directoryPath stringByAppendingPathComponent:fileName];
    
    return result;
}

#pragma mark - Private

+ (NSString *)templateJSONNameForLanguage:(Language)language {
    
    NSString *jsonName;
    
    switch (language) {
        case LanguageObjectiveC:
            jsonName = [NSString stringWithFormat:@"template.json"];
            break;
        case LanguageSwift:
            jsonName = [NSString stringWithFormat:@"swift-template.json"];

            break;
    }
    
    return jsonName;
}

@end
