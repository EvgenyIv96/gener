//
//  FIleTemplate.m
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import "FIleTemplate.h"

@implementation FIleTemplate

- (instancetype)initWithJSON:(NSDictionary *)json {
    self = [super init];
    
    if (self) {
        
        _nameTemplate = json[@"name"];
        _extension = json[@"extension"];
        
        NSURL *destination = [NSURL URLWithString:json[@"destination_path"]];
        NSURL *tempaltePath = [NSURL URLWithString:json[@"template_path"]];
        
        _destinationPath = destination;
        _templatePath = tempaltePath;
        
    }
    return self;
}

@end
