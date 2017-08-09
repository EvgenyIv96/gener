//
//  TemplateFileMeta.m
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import "TemplateFileMeta.h"

@implementation TemplateFileMeta

- (instancetype)initWithJSON:(NSDictionary *)json {
    self = [super init];
    
    if (self) {
        
        _nameTemplate = json[@"name"];
        _extension = json[@"extension"];
        
        NSURL *destinationURL = [NSURL URLWithString:json[@"destination_path"]];
        
        NSString *templatePath = json[@"template_path"];
        NSString *bundlePath = [[NSBundle mainBundle] resourcePath];
        NSString *fullPath = [bundlePath stringByAppendingPathComponent:templatePath];
        
        NSURL *tempaltePathURL = [NSURL URLWithString:fullPath];
        
        _destinationPath = destinationURL;
        _templatePath = tempaltePathURL;
        
    }
    return self;
}

@end
