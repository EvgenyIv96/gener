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
    
}

- (IBAction)generateButtonTapped:(NSButton *)sender {
    
}

#pragma mark - GenerationViewInput

- (void)setupInitialState {
    
}


@end
