//
//  ETAnswerButton.h
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/19/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETAnswerButton : UIButton
@property(nonatomic, assign) BOOL isSelected;
@property(nonatomic, assign) BOOL isRight;
- (void)updateButton;
@end
