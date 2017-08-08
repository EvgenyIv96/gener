//
//  SourceFile.h
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TemplateFileMeta;
@class ModuleSettings;

@interface SourceFile : NSObject

- (instancetype)initWithFileTemplate:(TemplateFileMeta *)fileTemplate settings:(ModuleSettings *)settings;

+ (instancetype)fileWithFileTemplate:(TemplateFileMeta *)fileTemplate settings:(ModuleSettings *)settings;

- (void)configure;

- (NSString *)content;

- (NSString *)destinationPath;

- (NSString *)extension;

- (NSString *)name;

@end
