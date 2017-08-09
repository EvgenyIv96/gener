//
//  Generator.m
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import "Generator.h"

#import "TemplateFileMeta.h"
#import "TemplateJSONParser.h"
#import "FileCreator.h"
#import "SourceFile.h"
#import "ModuleSettings.h"

@interface Generator ()

@property (copy, nonatomic) NSArray<TemplateFileMeta *> *fileTemplates;
@property (copy, nonatomic) NSArray<SourceFile *> *sourceFiles;
@property (strong, nonatomic) TemplateJSONParser *parser;
@property (strong, nonatomic) FileCreator *fileCreator;

@end

@implementation Generator

#pragma mark - Initializer

- (instancetype)init {
    self = [super init];
    if (self) {
        _parser = [[TemplateJSONParser alloc] init];
        _fileTemplates = [[NSArray alloc] init];
        _sourceFiles = [[NSArray alloc] init];
        _fileCreator = [[FileCreator alloc] init];
    }
    return self;
}

#pragma mark - Public

- (void)setupWithTemplatePath:(NSURL *)pathToTemplate error:(NSError **)error {
    
    NSError *parserError;
    [self.parser setupWithPath:pathToTemplate error:&parserError];
    
    if (parserError) {
        *error = parserError;
        return;
    }
    
    self.fileTemplates = [self.parser parse];
}

- (void)setupWithModuleSettings:(ModuleSettings *)settings {
    
    NSMutableArray *sourceFiles = [[NSMutableArray alloc] init];
    
    for (TemplateFileMeta *template in self.fileTemplates) {
        SourceFile *file = [SourceFile fileWithFileTemplate:template settings:settings];
        [file configure];
        [sourceFiles addObject:file];
    }
    
    self.sourceFiles = [NSArray arrayWithArray:sourceFiles];
}

- (void)generate {
    
    NSError *generatorError;
    
    [self.fileCreator createFilesFromArray:self.sourceFiles error:&generatorError];
    
    if (generatorError) {
        NSLog(@"Generator Error: %@", generatorError);
    }
    
}

@end
