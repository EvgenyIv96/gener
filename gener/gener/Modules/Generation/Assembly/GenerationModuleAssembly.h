//
//  GenerationModuleAssembly.h
//  gener
//
//  Created by Юра Привезенцев on 24.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NSViewController;

@interface GenerationModuleAssembly : NSObject

- (void)buildGenerationModuleWithCompletion:(void (^) (NSViewController *viewController))completion;

@end
