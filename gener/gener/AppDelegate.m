//
//  AppDelegate.m
//  gener
//
//  Created by Юра Привезенцев on 24.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import "AppDelegate.h"
#import "GenerationModuleAssembly.h"

@interface AppDelegate ()
@property (nonatomic) NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [[GenerationModuleAssembly new] buildGenerationModuleWithCompletion:^(NSViewController *viewController) {
        
        self.window = [NSWindow windowWithContentViewController:viewController];
        
        [self.window makeKeyAndOrderFront:NSApp];
        
    }];
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
