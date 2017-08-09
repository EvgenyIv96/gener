//
//  GenerationViewInput.h
//  gener
//
//  Created by Юра Привезенцев on 24.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GenerationViewInput <NSObject>


/**
 Method is used to setup initial view state.
 */
- (void)setupInitialState;


/**
 Method is used to update view with new module path string.

 @param modulePathString NSString String with module path.
 */
- (void)updateViewWithNewModulePathString:(NSString *)modulePathString;


/**
 Method is used to update view with full author name.

 @param authorNameString NSString full author name string.
 */
- (void)updateViewWithAuthorNameString:(NSString *)authorNameString;

@end
