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
@protocol GenerationModuleRouting;

@class Generator;

@interface GenerationPresenter : NSObject <GenerationViewOutput>

@property (weak, nonatomic) id<GenerationViewInput> view;
@property (weak, nonatomic) id<GenerationModuleRouting> router;

@property (strong, nonatomic) Generator *generator;

@end
