//
//  FinishViewController.m
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import "FinishViewController.h"
#import "AppDelegate.h"
#import "Utils.h"
@implementation FinishViewController {
    IBOutlet UILabel *_resultLabel;
    IBOutlet UIButton *_nextButton;
    IBOutlet UIActivityIndicatorView *_indicator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_indicator setHidden:YES];
    [_resultLabel setText:[NSString stringWithFormat:@"%ld/%ld", (unsigned long)[AppDelegate instance].trainingManager.currentTraining.rightAnswersCount, (unsigned long)[AppDelegate instance].trainingManager.currentTraining.questions.count]];
    [_nextButton setTitle:loc(@"Play_again") forState:UIControlStateNormal];
    [_nextButton addTarget:self action:@selector(onStart:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onStart:(id)sender {
    [_nextButton setHidden:YES];
    [_indicator setHidden:NO];
    [_indicator startAnimating];
    [[AppDelegate instance].trainingManager createTrainingWithCompletion:^(BOOL finished) {
        [_indicator stopAnimating];
        [_indicator setHidden:YES];
        [_nextButton setHidden:NO];
        if (finished) {
            [self startTraining];
        }else {
            NSLog(@"Can not load data!");
        }
    }];
}

- (void)startTraining {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *trainingController = [sb instantiateViewControllerWithIdentifier:@"TrainingController"];
    [self.navigationController pushViewController:trainingController animated:YES];
}
@end
