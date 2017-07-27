//
//  NSURL+GenerURL.m
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import "NSURL+GenerURL.h"

@implementation NSURL (GenerURL)

- (NSString *)URLStringWithoutFilePrefix {
    
    NSString *absoluteURL = self.absoluteString;
    
    NSString *newString = [absoluteURL stringByReplacingOccurrencesOfString:@"file://" withString:@""];
    
    return newString;
    
}

@end
