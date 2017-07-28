//
//  FileCreator.h
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileCreator : NSObject

- (void)createFilesFromArray:(NSArray *)templates error:(NSError **)error;

@end
