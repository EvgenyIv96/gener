//
//  Generator.m
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import "Generator.h"

#import "FIleTemplate.h"
#import "TemplateJSONParser.h"
#import "FileCreator.h"
#import "SourceFile.h"

@interface Generator ()

@property (copy, nonatomic) NSArray<FIleTemplate *> *fileTemplates;
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

- (void)setupWithRootDestinationPath:(NSURL *)rootPath moduleName:(NSString *)moduleName {
    
    NSMutableArray *sourceFiles = [[NSMutableArray alloc] init];
    
    for (FIleTemplate *template in self.fileTemplates) {
        SourceFile *file = [[SourceFile alloc] initWithFileTemplate:template];
        [file setupWithRootPath:rootPath moduleName:moduleName];
        
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
