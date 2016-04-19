//
//  QuestionView.m
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import "QuestionBehaviourViewController.h"
#import "AppDelegate.h"
#import "Question.h"
#import "ETAnswerButton.h"
#include <stdlib.h>

@implementation QuestionBehaviourViewController {
    NSArray *_answerButtons;
    IBOutlet ETAnswerButton *_firstButton;
    IBOutlet ETAnswerButton *_secondButton;
    IBOutlet ETAnswerButton *_thirdButton;
    IBOutlet ETAnswerButton *_fourthButton;
}

- (void)viewDidLoad {
    _answerButtons = [[NSArray alloc] initWithObjects:_firstButton, _secondButton, _thirdButton, _fourthButton, nil];
}

- (NSMutableArray *)randAlternatives:(NSArray *)alternatives {
    NSMutableArray *mArray = [[NSMutableArray alloc] initWithArray:alternatives];
    NSMutableArray *random = [[NSMutableArray alloc] init];
    u_int32_t n = (u_int32_t)alternatives.count;
    for (NSUInteger i = 0; i < alternatives.count; i++) {
        if (i >= 2) {
            break;
        }
        int r = arc4random_uniform(n);
        [random addObject:mArray[r]];
        [mArray removeObjectAtIndex:r];
        n--;
    }
    return random;
}

- (void)setRandomAnswersInButtons {
    int r = arc4random_uniform(2);
    NSUInteger currentQuestionIndex = [AppDelegate instance].trainingManager.currentTraining.currentQuestionIndex;
    Question *question = (Question *)[AppDelegate instance].trainingManager.currentTraining.questions[currentQuestionIndex];
    NSMutableArray *answers = [self randAlternatives:question.alternatives];
    [answers insertObject:question.word atIndex:r];
    for (NSUInteger i = 0; i < _answerButtons.count; i++) {
        ETAnswerButton *aButton = _answerButtons[i];
        Word *word = answers[i];
        [aButton setTitle:word.text forState:UIControlStateNormal];
        aButton.isRight = word == question.word;
    }
}

- (IBAction)onAnswerButton:(ETAnswerButton *)sender {
    //TODO lock all buttons;
    [_answerButtons makeObjectsPerformSelector:@selector(setUserInteractionEnabled:) withObject:@(NO)];
    sender.isSelected = YES;
    [_answerButtons makeObjectsPerformSelector:@selector(updateButton)];
}

- (void)start {
    [self.delegate behaviourFinished];
}

- (void)pouse {
    
}

- (void)finish {
    
}
@end
