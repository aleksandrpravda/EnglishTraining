//
//  Session.h
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Training;

@interface Session : NSObject
- (void)loadTrainingData:(NSArray *)array completion:(void(^)(Training *training))completion;
@end
