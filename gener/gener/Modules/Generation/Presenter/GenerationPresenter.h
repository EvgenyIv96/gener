//
//  GenerationPresenter.h
//  gener
//
//  Created by Юра Привезенцев on 24.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GenerationViewOutput.h"

@protocol GenerationViewInput;

@interface GenerationPresenter : NSObject <GenerationViewOutput>

@property (weak, nonatomic) id<GenerationViewInput> view;

@end
