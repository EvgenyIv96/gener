//
//  GenerationViewOutput.h
//  gener
//
//  Created by Юра Привезенцев on 24.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

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
 Method is used to tell presenter that generate button was tapped.
 
 @parameter moduleName NSString Name of module that will be generated.
 */
- (void)didTriggerGenerateButtonTappedEventWithModuleName:(NSString *)moduleName;

@end
