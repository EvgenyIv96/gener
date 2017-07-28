//
//  Generator.h
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ModuleSettings;

@interface Generator : NSObject

/**
 Configures generator instance with path to tempalte JSON file

 @param pathToTemplate path to template JSON file
 @param error error occured while setup
 */
- (void)setupWithTemplatePath:(NSURL *)pathToTemplate error:(NSError **)error;


/**
 Configures generator with settings

 Last preparation before generating files

 @param settings ModuleSettings settings of new module
 */
- (void)setupWithModuleSettings:(ModuleSettings *)settings;

/**
 Generates new module
 */
- (void)generate;

@end
