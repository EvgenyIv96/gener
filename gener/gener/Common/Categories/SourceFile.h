//
//  SourceFile.h
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FIleTemplate;

@interface SourceFile : NSObject

- (instancetype)initWithFileTemplate:(FIleTemplate *)fileTemplate;

- (void)setupWithRootPath:(NSURL *)rootPath moduleName:(NSString *)name;

@end
