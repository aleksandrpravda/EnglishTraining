//
//  ViewController.m
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import "StartViewController.h"
#import "AppDelegate.h"
#import "TrainingManager.h"
#import "Utils.h"

@implementation StartViewController {
    IBOutlet UIButton *_startButton;
    IBOutlet UIActivityIndicatorView *_indicator;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_indicator setHidden:YES];
    [_startButton setTitle:loc(@"Start_training") forState:UIControlStateNormal];
    [_startButton addTarget:self action:@selector(onStart:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onStart:(id)sender {
    [_startButton setHidden:YES];
    [_indicator setHidden:NO];
    [_indicator startAnimating];
    [[AppDelegate instance].trainingManager createTrainingWithCompletion:^(BOOL finished) {
        [_indicator stopAnimating];
        [_indicator setHidden:YES];
        [_startButton setHidden:NO];
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
