//
//  TrainingManager.h
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Training.h"

@interface TrainingManager : NSObject
@property(nonatomic, strong, readonly) Training *currentTraining;
- (void)createTrainingWithCompletion:(void(^)(BOOL finished))completion;
@end
