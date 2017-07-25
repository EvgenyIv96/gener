//
//  GenerationViewController.m
//  gener
//
//  Created by Юра Привезенцев on 24.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import "GenerationViewController.h"

#import "GenerationViewOutput.h"

@interface GenerationViewController ()

@property (weak) IBOutlet NSTextField *pathTextField;
@property (weak) IBOutlet NSTextField *moduleNameTextField;
@property (weak) IBOutlet NSButton *choosePathButton;
@property (weak) IBOutlet NSButton *generateButton;

@end

@implementation GenerationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.output didTriggerViewReadyEvent];
}

#pragma mark - IBActions

- (IBAction)chooseButtonTapped:(NSButton *)sender {
    [self.output didTriggerChooseButtonTappedEvent];
}

- (IBAction)generateButtonTapped:(NSButton *)sender {
    [self.output didTriggerGenerateButtonTappedEventWithModuleName:[self.moduleNameTextField stringValue]];
}

#pragma mark - GenerationViewInput

- (void)setupInitialState {
    
}

- (void)updateViewWithNewModulePathString:(NSString *)modulePathString {
    [self.pathTextField setStringValue:modulePathString];
}

#pragma mark - Routing 

- (void)openChooseDirectoryOpenPanelWithCompletion:(void (^) (NSOpenPanel *openPanel, NSInteger result))completion {
    
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    openPanel.canChooseFiles = NO;
    openPanel.canChooseDirectories = YES;
    openPanel.canCreateDirectories = YES;
    openPanel.allowsMultipleSelection = NO;
    
    [openPanel beginSheetModalForWindow:self.view.window completionHandler:^(NSInteger result) {
        
        if (completion) {
            completion(openPanel, result);
        }
        
    }];

}

@end
