//
//  ModuleSettings.m
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import "ModuleSettings.h"

@implementation ModuleSettings

#pragma mark - Initializer

- (instancetype)initWithPath:(NSString *)path classPrefix:(NSString *)prefix name:(NSString *)name project:(NSString *)project author:(NSString *)author company:(NSString *)company language:(Language)language {
    self = [super init];
    if (self) {
        _path = path;
        _classPrefix = prefix;
        _name = name;
        _project = project;
        _author = author;
        _company = company;
        _language = language;
    }

    return self;
}

#pragma mark - Factory method

+ (instancetype)settingsWithPath:(NSString *)path classPrefix:(NSString *)prefix name:(NSString *)name project:(NSString *)project author:(NSString *)author company:(NSString *)company language:(Language)language {
    return [[self alloc] initWithPath:path classPrefix:prefix name:name project:project author:author company:company language:language];
}


@end
