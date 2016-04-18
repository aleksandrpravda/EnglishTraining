//
//  TrainingController.h
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, SceneState) {
    QuestionState,
    AnswerState
};
#import "SceneBehaviourViewController.h"
@interface TrainingController : UIViewController<ObserverDelegate>

@end
