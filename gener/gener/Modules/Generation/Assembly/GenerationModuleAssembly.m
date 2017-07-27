//
//  GenerationModuleAssembly.m
//  gener
//
//  Created by Юра Привезенцев on 24.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import "GenerationModuleAssembly.h"
#import "GenerationViewController.h"
#import "GenerationPresenter.h"

@implementation GenerationModuleAssembly

- (void)buildGenerationModuleWithCompletion:(void (^) (NSViewController *viewController))completion {
    
    //Creating module components
    GenerationViewController *viewController = [[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"GenerationViewController"];
    GenerationPresenter *presenter = [[GenerationPresenter alloc] init];
    
    //Inject properties
    viewController.output = presenter;
    presenter.view = viewController;
    presenter.router = viewController;
    
    completion(viewController);
    
}

@end
