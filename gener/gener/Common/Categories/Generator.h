//
//  Generator.h
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Generator : NSObject

/**
 Configures generator instance with path to tempalte JSON file

 @param pathToTemplate path to template JSON file
 @param error error occured while setup
 */
- (void)setupWithTemplatePath:(NSURL *)pathToTemplate error:(NSError **)error;


/**
 Configures generator with destination path and module name

 Last preparation before generating files

 @param rootPath root path of new module
 @param moduleName name of new module
 */
- (void)setupWithRootDestinationPath:(NSURL *)rootPath moduleName:(NSString *)moduleName;

/**
 Generates new module
 */
- (void)generate;

@end
