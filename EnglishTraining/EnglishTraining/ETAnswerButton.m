//
//  ETAnswerButton.m
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/19/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import "ETAnswerButton.h"

@implementation ETAnswerButton
- (void)updateButton {
    if (_isSelected && _isRight) {
        [self setBackgroundImage:[UIImage imageNamed:@"answer_btn_right"] forState:UIControlStateNormal];
    }else if (!_isSelected && _isRight) {
        [self setBackgroundImage:[UIImage imageNamed:@"answer_btn_right"] forState:UIControlStateNormal];
    }else if (_isSelected &&!_isRight) {
        [self setBackgroundImage:[UIImage imageNamed:@"answer_btn_wrong"] forState:UIControlStateNormal];
    }else if(!_isSelected && !_isRight) {
        [self setBackgroundImage:[UIImage imageNamed:@"answer_btn"] forState:UIControlStateNormal];
    }
}
@end
