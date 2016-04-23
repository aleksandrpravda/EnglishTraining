//
//  Training.h
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, SceneState) {
    StartState,
    QuestionState,
    AnswerState,
    FinishState
};
@interface Training : NSObject
@property(nonatomic, assign) NSUInteger currentQuestionIndex;
@property(nonatomic, assign) NSUInteger rightAnswersCount;
@property(nonatomic, readonly) NSArray *questions;
@property(nonatomic, assign) SceneState state;
- (instancetype)initWithQuestions:(NSArray *)questions;
@end
