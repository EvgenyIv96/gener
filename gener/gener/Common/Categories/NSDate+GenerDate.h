//
//  NSDate+GenerDate.h
//  gener
//
//  Created by Privezentsev Yury on 28.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (GenerDate)

/**
 Formats NSDate to NSString with specified format using NSDateFormatter

 @param format NSString date format like in NSDateFormatter
 @return formatted NSString representing date 
 */
-(NSString *)stringWithFormat:(NSString *)format;

@end
