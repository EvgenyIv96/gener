//
//  TemplateJSONParser.h
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FIleTemplate;

@interface TemplateJSONParser : NSObject

- (void)setupWithPath:(NSURL *)path error:(NSError **)error;

- (NSArray<FIleTemplate *> *)parse;

@end
