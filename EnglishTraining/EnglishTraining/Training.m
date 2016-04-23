//
//  Training.m
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import "Training.h"
#import "Question.h"
#import "Utils.h"

@implementation Training {
    NSMutableArray *_questions;
}

- (instancetype)initWithQuestions:(NSArray *)questions {
    self = [super init];
    if (self) {
        _questions = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < questions.count; i++) {
            NSDictionary *questionDictionary = [Utils safeDictionary:questions[i]];
            Question *question = [[Question alloc] initWithDictionary:questionDictionary];
            [_questions addObject:question];
            self.state = StartState;
        }
    }
    return self;
}

- (NSArray *)questions {
    return _questions;
}
@end
