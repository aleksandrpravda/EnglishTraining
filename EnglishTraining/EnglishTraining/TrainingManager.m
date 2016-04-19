//
//  TrainingManager.m
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import "TrainingManager.h"
#import "AppDelegate.h"
#include <stdlib.h>
int const COUNT_OF_QUESTIONS_IN_TRAINING = 10;
#define QUESTION_IDS [NSArray arrayWithObjects: @"211138", @"226138", @"177344", @"196957", @"224324", @"89785", @"79639", @"173148", @"136709", @"158582", @"92590", @"135793", @"68068", @"64441", @"46290", @"128173",@"51254", @"55112", @"222435", nil]
@implementation TrainingManager {
    Training *_training;
    NSUInteger _count;
}

- (Training *)currentTraining {
    return _training;
}

- (void)createTrainingWithCompletion:(void(^)(BOOL finished))completion {
    [[AppDelegate instance].session loadQuestions:[self getRandomQuestionsID] completion:^(NSArray *questions) {
        if (_training) {
            [self createTraining:questions];
            completion(YES);
        }else {
            completion(NO);
        }
    }];
}

- (NSArray *)getRandomQuestionsID {
    u_int32_t n = (u_int32_t)QUESTION_IDS.count;
    NSMutableArray *questions = [[NSMutableArray alloc] initWithArray:QUESTION_IDS];
    NSMutableArray *trainingQuestions = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < QUESTION_IDS.count; i++) {
        if (i >= COUNT_OF_QUESTIONS_IN_TRAINING) {
            break;
        }
        int r = arc4random_uniform(n);
        [trainingQuestions addObject:questions[r]];
        [questions removeObjectAtIndex:r];
        n--;
    }
    return trainingQuestions;
}

- (void)createTraining:(NSArray *)questions {
    _count++;
    _training = [[Training alloc] initWithQuestions:questions];
    
}
@end
