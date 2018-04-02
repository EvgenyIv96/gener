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
#import "ModuleSettings.h"
#import "NSFileManager+GenerFileManager.h"


@interface GenerationPresenter ()

@property (strong, nonatomic) NSURL *mainPathURL;
@property (strong, nonatomic) NSURL *templatePathURL;

@end

@implementation GenerationPresenter

#pragma mark - GenerationViewOutput

- (void)didTriggerViewReadyEvent {
    
    self.generator = [[Generator alloc] init];
    
    [self.view setupInitialState];
    
    NSString *fullUserName = [self fullUserNameInSystem];
    
    [self.view updateViewWithAuthorNameString:fullUserName];
    
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

- (void)didTriggerTemplateChooseButtonTappedEvent {
    
    [self.router openChooseDirectoryOpenPanelWithCompletion:^(NSOpenPanel *panel,NSInteger result) {
        
        if (result == NSFileHandlingPanelOKButton) {
            self.templatePathURL = panel.URLs[0];
            NSLog(@"New template PathURL: %@", self.templatePathURL);
            
            NSString *pathString = [self.templatePathURL URLStringWithoutFilePrefix];
            
            [self.view updateViewWithNewTemplatePathString:pathString];
        }
        
    }];
    
}

- (void)didTriggerGenerateButtonTappedEventWithModuleSettings:(ModuleSettings *)settings {

    NSString *pathString = [self pathStringForTemplateWithModuleSettings:settings];

    NSError *generatorSetupError;
    [self.generator setupWithTemplatePath:[NSURL URLWithString:pathString] error:&generatorSetupError];

    [self.generator setupWithModuleSettings:settings];
    
    [self.generator generate];
    
}

#pragma mark - Private Methods

- (NSString *)fullUserNameInSystem {
    
    return NSFullUserName();
    
}

- (NSString *)pathStringForTemplateWithModuleSettings:(ModuleSettings *)settings {
    
    if (self.templatePathURL) {
        
        NSString *path = [NSFileManager findJSONFileInDirecory:[self.templatePathURL URLStringWithoutFilePrefix] forSelectedLanguage:settings.language];
        return path;
        
    }
    
    return nil;
    
}

@end
