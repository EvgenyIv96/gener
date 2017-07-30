//
//  ModuleSettings.h
//  gener
//
//  Created by Privezentsev Yury on 25.07.17.
//  Copyright © 2017 GNR. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Language) {
    LanguageObjectiveC = 0,
    LanguageSwift = 1
};

@interface ModuleSettings : NSObject

@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *project;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *company;
@property (assign, nonatomic) Language language;

- (instancetype)initWithPath:(NSString *)path name:(NSString *)name project:(NSString *)project author:(NSString *)author company:(NSString *)company language:(Language)language;

+ (instancetype)settingsWithPath:(NSString *)path name:(NSString *)name project:(NSString *)project author:(NSString *)author company:(NSString *)company language:(Language)language;


@end
