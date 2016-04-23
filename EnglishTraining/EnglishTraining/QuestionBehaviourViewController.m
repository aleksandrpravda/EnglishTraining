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
#import "Utils.h"

@implementation QuestionBehaviourViewController {
    Question *_currentQuestion;
    NSArray *_answerButtons;
    IBOutlet ETAnswerButton *_firstButton;
    IBOutlet ETAnswerButton *_secondButton;
    IBOutlet ETAnswerButton *_thirdButton;
    IBOutlet ETAnswerButton *_fourthButton;
    IBOutlet UIButton *_passButton;
}

- (void)viewDidLoad {
    _answerButtons = [[NSArray alloc] initWithObjects:_firstButton, _secondButton, _thirdButton, _fourthButton, nil];
    [_passButton setTitle:loc(@"Do_Not_Remember") forState:UIControlStateNormal];
}

- (NSMutableArray *)randAlternatives:(NSArray *)alternatives {
    NSMutableArray *mArray = [[NSMutableArray alloc] initWithArray:alternatives];
    NSMutableArray *random = [[NSMutableArray alloc] init];
    u_int32_t n = (u_int32_t)alternatives.count;
    for (NSUInteger i = 0; i < alternatives.count; i++) {
        if (i > 2) {
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
    int r = arc4random_uniform(4);
    NSMutableArray *answers = [self randAlternatives:_currentQuestion.alternatives];
    [answers insertObject:_currentQuestion.word atIndex:r];
    for (NSUInteger i = 0; i < _answerButtons.count; i++) {
        ETAnswerButton *aButton = _answerButtons[i];
        Word *word = answers[i];
        [aButton setTitle:word.translation forState:UIControlStateNormal];
        aButton.isRight = word == _currentQuestion.word;
    }
}

- (IBAction)onAnswerButton:(UIButton *)sender {
    if ([sender isKindOfClass:[ETAnswerButton class]]) {
        [_answerButtons makeObjectsPerformSelector:@selector(setUserInteractionEnabled:) withObject:nil];
        ((ETAnswerButton *)sender).isSelected = YES;
        if (((ETAnswerButton *)sender).isRight) {
            [AppDelegate instance].trainingManager.currentTraining.rightAnswersCount++;
        }
    } else {
        [sender setUserInteractionEnabled:NO];
    }
    [_answerButtons makeObjectsPerformSelector:@selector(updateButton)];
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.delegate behaviourFinished];
    });
}

- (void)start {
    NSUInteger currentQuestionIndex = [AppDelegate instance].trainingManager.currentTraining.currentQuestionIndex;
    _currentQuestion = (Question *)[AppDelegate instance].trainingManager.currentTraining.questions[currentQuestionIndex];
    [self setRandomAnswersInButtons];
}

- (void)pouse {
    
}

- (void)finish {
    [self.view removeFromSuperview];
}
@end
