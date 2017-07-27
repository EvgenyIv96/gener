//
//  NSURL+GenerURL.h
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (GenerURL)

/**
 Cuts "file://" prefix from absolute url string

 Output Example: @"/Users/yuprivezentsev/Documents/"
 
 @return path without "file://" prefix
 */
- (NSString *)URLStringWithoutFilePrefix;

@end
