//
//  GenerationModuleRouting.h
//  gener
//
//  Created by Евгений on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSOpenPanel;

@protocol GenerationModuleRouting <NSObject>

/**
 Method is used to show Open Panel for creating and choosing directory.

 @param completion Block Completion block with open panel result.
 */
- (void)openChooseDirectoryOpenPanelWithCompletion:(void (^) (NSOpenPanel *openPanel, NSInteger result))completion;

@end
