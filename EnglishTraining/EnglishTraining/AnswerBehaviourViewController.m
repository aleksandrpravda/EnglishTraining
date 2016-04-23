//
//  AnswerView.m
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import "AnswerBehaviourViewController.h"
#import "AppDelegate.h"
#import "Question.h"
#import <UIImageView+AFNetworking.h>
#import "Utils.h"

@interface AnswerBehaviourViewController()
@property(nonatomic, strong) IBOutlet UILabel *translationLabel;
@property(nonatomic, strong) IBOutlet UIImageView *imageView;
@property(nonatomic, strong) IBOutlet UIButton *nextButton;
@property(nonatomic, strong) IBOutlet UIActivityIndicatorView *indicatorView;
@property(nonatomic, strong) IBOutlet UILabel *emptyImageLabel;
@end

@implementation AnswerBehaviourViewController {
    Question *_currentQuestion;

}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)translation {
    [_translationLabel setText:_currentQuestion.word.translation];
    [_nextButton setTitle:loc(@"Next_button_text") forState:UIControlStateNormal];
    [_emptyImageLabel setText:@"No image text"];
}

- (IBAction)onNext:(id)sender {
    [self.delegate behaviourFinished];
}

- (void)start {
    [_indicatorView setHidden:NO];
    [_indicatorView startAnimating];
    [_emptyImageLabel setHidden:YES];
    [_imageView setHighlighted:NO];
    NSUInteger currentQuestionIndex = [AppDelegate instance].trainingManager.currentTraining.currentQuestionIndex;
    _currentQuestion = (Question *)[AppDelegate instance].trainingManager.currentTraining.questions[currentQuestionIndex];
    NSString *strURL = [NSString stringWithFormat:@"http:%@", _currentQuestion.imageUrl];
    NSURL *URL = [NSURL URLWithString:strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    __weak __typeof(self)weakSelf = self;
    [_imageView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        [weakSelf.indicatorView stopAnimating];
        [weakSelf.indicatorView setHidden:YES];
        [weakSelf.emptyImageLabel setHidden:YES];
        [weakSelf.imageView setImage:image];
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        [weakSelf.indicatorView stopAnimating];
        [weakSelf.indicatorView setHidden:YES];
        [weakSelf.emptyImageLabel setHidden:NO];
        [weakSelf.imageView setHidden:YES];
    }];
    [self translation];
}

- (void)pouse {
    
}

- (void)finish {
    [self.view removeFromSuperview];
}

@end
