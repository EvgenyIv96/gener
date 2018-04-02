//
//  NSDate+GenerDate.m
//  gener
//
//  Created by Privezentsev Yury on 28.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import "NSDate+GenerDate.h"

@implementation NSDate (GenerDate)

-(NSString *)stringWithFormat:(NSString *)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    
    return [dateFormatter stringFromDate:self];
}

@end
