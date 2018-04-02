//
//  GenerationViewOutput.h
//  gener
//
//  Created by Юра Привезенцев on 24.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ModuleSettings;

@protocol GenerationViewOutput <NSObject>

/**
 Method is used to tell presenter that view is ready.
 */
- (void)didTriggerViewReadyEvent;

/**
 Method is used to tell presenter that choose button was tapped.
 */
- (void)didTriggerChooseButtonTappedEvent;

/**
 Method is used to tell presenter that template choose button was tapped.
 */
- (void)didTriggerTemplateChooseButtonTappedEvent;

/**
 Method is used to tell presenter that generate button was tapped.
 
 @parameter settings ModuleSettings settings of module that will be generated.
 */
- (void)didTriggerGenerateButtonTappedEventWithModuleSettings:(ModuleSettings *)settings;

@end
