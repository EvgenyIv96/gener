//
//  GenerationPresenter.m
//  gener
//
//  Created by Юра Привезенцев on 24.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GenerationPresenter.h"

#import "GenerationViewInput.h"
#import "GenerationModuleRouting.h"

#import "Generator.h"

#import "NSURL+GenerURL.h"

@interface GenerationPresenter ()

@property (strong, nonatomic) NSURL *mainPathURL;

@end

@implementation GenerationPresenter

#pragma mark - GenerationViewOutput

- (void)didTriggerViewReadyEvent {
    
    self.generator = [[Generator alloc] init];
    
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"template" ofType:@"json"];
    
    NSError *generatorSetupError;
    
    [self.generator setupWithTemplatePath:[NSURL URLWithString:pathString] error:&generatorSetupError];
    
    [self.view setupInitialState];
}

- (void)didTriggerChooseButtonTappedEvent {
    
    [self.router openChooseDirectoryOpenPanelWithCompletion:^(NSOpenPanel *panel,NSInteger result) {
        
        if (result == NSFileHandlingPanelOKButton) {
            self.mainPathURL = panel.URLs[0];
            NSLog(@"New mainPathURL: %@", self.mainPathURL);
            
            NSString *pathString = [self.mainPathURL URLStringWithoutFilePrefix];
            
            [self.view updateViewWithNewModulePathString:pathString];
        }
        
    }];
    
}

- (void)didTriggerGenerateButtonTappedEventWithModuleSettings:(ModuleSettings *)settings {

    [self.generator setupWithModuleSettings:settings];
    
    [self.generator generate];
    
}

#pragma mark - Private Methods


@end
