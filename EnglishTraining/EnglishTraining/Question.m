
//
//  Question.m
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import "Question.h"
#import "Utils.h"
#import "Word.h"
NSString * const kWord = @"text";
NSString * const kTranslat = @"translation";
NSString * const kTranscript = @"transcription";
NSString * const kAudioUrl = @"soundUrl";
NSString * const kImage = @"images";
NSString * const kAlternatives = @"alternatives";
NSString * const kIdentifire = @"meaningId";
NSString * const kDefinition = @"definition";

@implementation Question

- (nonnull instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.word = [[Word alloc] init];
        self.word.text = [Utils safeString:dictionary[kWord]];
        self.word.translation = [Utils safeString:dictionary[kTranslat]];
        self.word.transcription = [Utils safeString:dictionary[kTranscript]];
        
        self.audioURL = [Utils safeString:dictionary[kAudioUrl]];
        NSArray *images = [Utils safeArray:dictionary[kImage]];
        self.imageUrl = images.count > 0 ? images[0] : @"";
        self.identifire = [Utils safeString:dictionary[kIdentifire]];
        self.definition = [Utils safeString:dictionary[kDefinition]];
        NSArray *alt = [Utils safeArray:dictionary[kAlternatives]];
        self.alternatives = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < alt.count; i++) {
            NSDictionary *dict = [Utils safeDictionary:alt[i]];
            Word *variance = [[Word alloc] initWithDictionary:dict];
            [self.alternatives addObject:variance];
        }
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.word = [aDecoder decodeObjectForKey:kWord];
        self.audioURL = [aDecoder decodeObjectForKey:kAudioUrl];
        self.imageUrl = [aDecoder decodeObjectForKey:kImage];
        self.alternatives = [aDecoder decodeObjectForKey:kAlternatives];
        self.identifire = [aDecoder decodeObjectForKey:kIdentifire];
        self.definition = [aDecoder decodeObjectForKey:kDefinition];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_word forKey:kWord];
    [aCoder encodeObject:_audioURL forKey:kAudioUrl];
    [aCoder encodeObject:_imageUrl forKey:kImage];
    [aCoder encodeObject:_identifire forKey:kIdentifire];
    [aCoder encodeObject:_alternatives forKey:kAlternatives];
    [aCoder encodeObject:_definition forKey:kDefinition];
}

@end
