//
//  Word.m
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/18/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import "Word.h"
#import "Utils.h"
NSString * const kText = @"text";
NSString * const kTranslation = @"translation";
NSString * const kTranscription = @"transcription";

@implementation Word
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.text = [Utils safeString:dictionary[kText]];
        self.transcription = [Utils safeString:dictionary[kTranscription]];
        self.translation = [Utils safeString:dictionary[kTranslation]];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.text = [aDecoder decodeObjectForKey:kText];
        self.translation = [aDecoder decodeObjectForKey:kTranslation];
        self.transcription = [aDecoder decodeObjectForKey:kTranscription];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_text forKey:kText];
    [aCoder encodeObject:_transcription forKey:kTranscription];
    [aCoder encodeObject:_translation forKey:kTranslation];
}
@end
