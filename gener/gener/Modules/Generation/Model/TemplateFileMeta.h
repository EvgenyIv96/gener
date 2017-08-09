//
//  TemplateFileMeta.h
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Object representation of JSON file template with format:
 
    {
        name: "$module_name$ViewInput",
        extension: ".m",
        destination_path: "view",
        template_path: "../path"
    }
 
 */
@interface TemplateFileMeta : NSObject

@property (strong, nonatomic) NSString *nameTemplate;
@property (strong, nonatomic) NSString *extension;
@property (strong, nonatomic) NSURL *destinationPath;
@property (strong, nonatomic) NSURL *templatePath;

/**
 Initializes object with JSON dictionary of specified format

 @param json dictionary with specified format
 @return instance of FIleTemplate
 */
- (instancetype)initWithJSON:(NSDictionary *)json;

@end
