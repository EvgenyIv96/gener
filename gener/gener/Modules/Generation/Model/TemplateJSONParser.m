//
//  TemplateJSONParser.m
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import "TemplateJSONParser.h"
#import "TemplateFileMeta.h"

@interface TemplateJSONParser ()

@property (copy, nonatomic) NSArray *jsonArray;

@end

@implementation TemplateJSONParser

#pragma mark - Initializer

-(instancetype)init {
    self = [super init];
    if (self) {
        _jsonArray = [[NSArray alloc] init];
    }
    return self;
}

#pragma mark - Public

- (void)setupWithPath:(NSURL *)path error:(NSError **)error {
    
    self.jsonArray = [self JSONArrayFromFileAtPath:path.absoluteString];
    
}

- (NSArray<TemplateFileMeta *> *)parse {
    
    NSMutableArray *parsed = [[NSMutableArray alloc] init];
    
    for (NSDictionary *json in self.jsonArray) {
        TemplateFileMeta *template = [[TemplateFileMeta alloc] initWithJSON:json];
        [parsed addObject:template];
    }
    
    return [NSArray arrayWithArray:parsed];
}

#pragma mark - Private

- (NSArray *)JSONArrayFromFileAtPath:(NSString *)filePath {
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSError *parsingError;
    NSDictionary *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parsingError];
    
    NSLog(@"parsing error: %@", parsingError);
    
    return jsonArray[@"templates"];
}

@end
