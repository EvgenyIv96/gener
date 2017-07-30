//
//  SourceFile.h
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FIleTemplate;
@class ModuleSettings;

@interface SourceFile : NSObject

- (instancetype)initWithFileTemplate:(FIleTemplate *)fileTemplate settings:(ModuleSettings *)settings;

- (void)configure;

- (NSString *)content;

- (NSString *)destinationPath;

- (NSString *)extention;

- (NSString *)name;

+ (instancetype)fileWithFileTemplate:(FIleTemplate *)fileTemplate settings:(ModuleSettings *)settings;

@end
