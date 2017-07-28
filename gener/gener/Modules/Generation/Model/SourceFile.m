//
//  SourceFile.m
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import "SourceFile.h"

#import "FIleTemplate.h"
#import "ModuleSettings.h"

#import "NSDate+GenerDate.h"

@interface SourceFile ()

@property (strong, nonatomic) FIleTemplate *template;
@property (strong, nonatomic) ModuleSettings *settings;

@property (strong, nonatomic) NSString *fileContent;
@property (strong, nonatomic) NSString *destinationFullPath;

@end

@implementation SourceFile

#pragma mark - Initializer

- (instancetype)initWithFileTemplate:(FIleTemplate *)fileTemplate settings:(ModuleSettings *)settings {
    self = [super init];
    if (self) {
        _template = fileTemplate;
        _settings = settings;
    }

    return self;
}

#pragma mark - Factory method

+ (instancetype)fileWithFileTemplate:(FIleTemplate *)fileTemplate settings:(ModuleSettings *)settings {
    return [[self alloc] initWithFileTemplate:fileTemplate settings:settings];
}

#pragma mark - Public

- (void)configure {

    NSData *contentsOfFileData = [[NSFileManager defaultManager] contentsAtPath:self.template.templatePath.absoluteString];
    NSString *fileContentsString = [[NSString alloc] initWithData:contentsOfFileData encoding:NSUTF8StringEncoding];

    self.fileContent = [self replacePlaceholdersInString:fileContentsString];

    NSURL * destinationUrl = [NSURL URLWithString:self.settings.path];
    destinationUrl = [destinationUrl URLByAppendingPathComponent:self.template.destinationPath.absoluteString];

    self.destinationFullPath = destinationUrl.absoluteString;
}

- (NSString *)content {
    return self.fileContent;
}

- (NSString *)destinationPath {
    return self.destinationFullPath;
}

- (NSString *)extention {
    return self.template.extension;
}

- (NSString *)name {
    return [NSString stringWithFormat:@"%@%@", self.settings.name, self.template.nameTemplate];
}

#pragma mark - Private

- (NSString *)replacePlaceholdersInString:(NSString *)contentsString {

    NSString *resultString = [contentsString copy];
    NSDate *currentDate = [NSDate date];

    NSDictionary *dictionary = @{
            @"$moduleName$": self.settings.name,
            @"$projectName$": self.settings.project,
            @"$author$": self.settings.author,
            @"$date$": [currentDate stringWithFormat:@"dd.MM.yyyy"],
            @"$year$": [currentDate stringWithFormat:@"yyyy"],
            @"$company$": self.settings.company
    };

    for (NSString *placeholder in dictionary.allKeys) {
        resultString = [resultString stringByReplacingOccurrencesOfString:placeholder withString:dictionary[placeholder]];
    }

    return resultString;
}

@end
