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

- (void)viewDidLoad {
    [super viewDidLoad];
    _state = StartState;
    [self behaviourFinished];
}

- (void)changeBehaviour {
    switch (_state) {
        case QuestionState: {
            [self exchangeView:@"QuestionBehaviourViewController" animated:YES];
            break;
        }
        case AnswerState: {
            [self exchangeView:@"AnswerBehaviourViewController" animated:YES];
            break;
        }
        case FinishState: {
//            TODO load finish
        }
        default:
            break;
    }
}

- (void)exchangeView:(NSString *)viewName animated:(BOOL)animated {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CGPoint startPosition = CGPointMake(self.view.frame.size.width + 10, 100);
    CGPoint finishposition = CGPointMake(- (self.view.frame.size.width + 10), 100);
    SceneBehaviourViewController *newActor = [sb instantiateViewControllerWithIdentifier:viewName];
    newActor.view.frame = CGRectMake(startPosition.x, startPosition.y, 200, 200);
    [UIView animateWithDuration:3.0f animations:^{
        newActor.view.frame = CGRectMake(0, 100, newActor.view.frame.size.width, newActor.view.frame.size.height);
        self.actor.view.frame = CGRectMake(finishposition.x, finishposition.y, newActor.view.frame.size.width, newActor.view.frame.size.height);
    } completion:^(BOOL finished) {
        [self.actor finish];
        self.actor = newActor;
        [self.actor start];
    }];
}

- (void)behaviourFinished {
    switch (_state) {
        case StartState:
            _state = QuestionState;
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
