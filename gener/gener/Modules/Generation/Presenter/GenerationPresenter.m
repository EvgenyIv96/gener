//
//  GenerationPresenter.m
//  gener
//
//  Created by Юра Привезенцев on 24.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import "GenerationPresenter.h"
#import <Cocoa/Cocoa.h>

#import "GenerationViewInput.h"

#import "GenerationModuleRouting.h"

@interface GenerationPresenter ()

@property (strong, nonatomic) NSURL *mainPathURL;

@end

@implementation GenerationPresenter

#pragma mark - GenerationViewOutput

- (void)didTriggerViewReadyEvent {
    
}

- (void)didTriggerChooseButtonTappedEvent {
    
    [self.router openChooseDirectoryOpenPanelWithCompletion:^(NSOpenPanel *panel,NSInteger result) {
        
        if (result == NSFileHandlingPanelOKButton) {
            self.mainPathURL = panel.URLs[0];
            NSLog(@"New mainPathURL: %@", self.mainPathURL);
            
            NSString *pathString = [self cutFilePrefixFromURLString:[self.mainPathURL absoluteString]];
            
            [self.view updateViewWithNewModulePathString:pathString];
        }
        
    }];
    
}

- (void)didTriggerGenerateButtonTappedEventWithModuleName:(NSString *)moduleName {
    
}

#pragma mark - Private Methods

- (NSString *)cutFilePrefixFromURLString:(NSString *)urlString {

    NSString *newString = [urlString stringByReplacingOccurrencesOfString:@"file://" withString:@""];
    
    return newString;
    
}

@end
