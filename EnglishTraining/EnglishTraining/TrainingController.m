//
//  TrainingController.m
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import "TrainingController.h"
#import "SceneBehaviourViewController.h"

@interface TrainingController()
@property (assign) SceneState state;
@property (strong, nonatomic, nonnull) SceneBehaviourViewController *actor;
@end

@implementation TrainingController

- (void)changeBehaviour {
    switch (_state) {
        case QuestionState:
            break;
        case AnswerState:
            break;
        default:
            break;
    }
}

- (void)behaviourFinished {
    switch (_state) {
        case QuestionState:
            _state = AnswerState;
            break;
        case AnswerState:
            _state = QuestionState;
            break;
        default:
            break;
    }
    [self changeBehaviour];
}
@end
