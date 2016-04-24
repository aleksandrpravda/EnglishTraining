//
//  TrainingController.m
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import "TrainingController.h"
#import "AppDelegate.h"
#import "SceneBehaviourViewController.h"
#import "ETProgresImageView.h"
#import "Question.h"

@interface TrainingController()
@property (strong, nonatomic, nonnull) SceneBehaviourViewController *actor;
@end

@implementation TrainingController {
    IBOutlet ETProgresImageView *_progress;
    IBOutlet UIView *_ticketContainer;
    IBOutlet UILabel *_wordLabel;
    Training *_training;
    BOOL _isFirst;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _isFirst = YES;
    [_progress setProgressImage:[UIImage imageNamed:@"progress.png"]];
    _training = [AppDelegate instance].trainingManager.currentTraining;
    [self behaviourFinished];
}

- (void)changeBehaviour {
    switch (_training.state) {
        case QuestionState: {
            if (!_isFirst) {
                _training.currentQuestionIndex++;
            }
            [self updateProgress];
            [self exchangeView:@"QuestionBehaviourViewController" animated:!_isFirst];
            _isFirst = NO;
            break;
        }
        case AnswerState: {
            [self exchangeView:@"AnswerBehaviourViewController" animated:YES];
            break;
        }
        case FinishState: {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *finishController = [sb instantiateViewControllerWithIdentifier:@"FinishViewController"];
            [self.navigationController pushViewController:finishController animated:YES];
        }
        default:
            break;
    }
}

- (void)updateProgress {
    CGFloat progress = (CGFloat)(_training.currentQuestionIndex + 1)/(CGFloat)_training.questions.count;
    [_progress setProgress:progress animated:YES];
}

- (void)exchangeView:(NSString *)viewName animated:(BOOL)animated {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CGPoint startPosition = CGPointMake(_ticketContainer.frame.size.width + 10, 0);
    CGPoint finishposition = CGPointMake(- (_ticketContainer.frame.size.width + 10), 0);
    SceneBehaviourViewController *newActor = [sb instantiateViewControllerWithIdentifier:viewName];
    [newActor setDelegate:self];
    [_actor setDelegate:nil];
    newActor.view.frame = CGRectMake(startPosition.x, startPosition.y, _ticketContainer.frame.size.width, _ticketContainer.frame.size.height);
    [_ticketContainer addSubview:newActor.view];
    [newActor start];
    if (animated) {
        [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            newActor.view.frame = CGRectMake(0, 0, newActor.view.frame.size.width, newActor.view.frame.size.height);
            self.actor.view.frame = CGRectMake(finishposition.x, finishposition.y, newActor.view.frame.size.width, newActor.view.frame.size.height);
        } completion:^(BOOL finished) {
            [self.actor finish];
            self.actor = newActor;
            [self updateWord];
        }];
    }else {
        newActor.view.frame = CGRectMake(0, 0, newActor.view.frame.size.width, newActor.view.frame.size.height);
        self.actor.view.frame = CGRectMake(finishposition.x, finishposition.y, newActor.view.frame.size.width, newActor.view.frame.size.height);
        [self.actor finish];
        self.actor = newActor;
        [self updateWord];
    }
}

- (void)updateWord {
    NSUInteger index = [AppDelegate instance].trainingManager.currentTraining.currentQuestionIndex;
    Question *question = [AppDelegate instance].trainingManager.currentTraining.questions[index];
    [_wordLabel setText:question.word.text];
}

- (void)behaviourFinished {
    switch (_training.state) {
        case StartState:
            _training.state = QuestionState;
            break;
        case QuestionState:
            _training.state = AnswerState;
            break;
        case AnswerState:
            if (_training.currentQuestionIndex + 1 >= _training.questions.count) {
                _training.state = FinishState;
            }else {
                _training.state = QuestionState;
            }
            break;
        default:
            break;
    }
    [self changeBehaviour];
}
@end
