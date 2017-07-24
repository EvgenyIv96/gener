//
//  GenerationViewController.h
//  gener
//
//  Created by Юра Привезенцев on 24.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "GenerationViewInput.h"

@protocol GenerationViewOutput;

@interface GenerationViewController : NSViewController <GenerationViewInput>

@property (strong, nonatomic) id<GenerationViewOutput> output;

@end
