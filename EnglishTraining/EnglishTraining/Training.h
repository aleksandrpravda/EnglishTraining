//
//  Training.h
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Training : NSObject
@property(nonatomic, assign) NSUInteger currentQuestionIndex;
@property(nonatomic, assign) NSUInteger rightAnswersCount;
@property(nonatomic, readonly) NSArray *questions;
- (instancetype)initWithQuestions:(NSArray *)questions;
@end
