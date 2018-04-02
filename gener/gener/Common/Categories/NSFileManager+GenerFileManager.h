//
//  NSFileManager+GenerFileManager.h
//  gener
//
//  Created by Tatiana Bocharnikova on 18.03.2018.
//  Copyright © 2018 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ModuleSettings.h"

@interface NSFileManager (GenerFileManager)

+ (NSString *)findJSONFileInDirecory:(NSString *)directoryPath forSelectedLanguage:(Language)language;

@end
