//
//  AppDelegate.h
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Session.h"
#import "TrainingManager.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic, nonnull) UIWindow *window;
@property (strong, nonatomic, nonnull) Session *session;
@property (strong, nonatomic, nonnull) TrainingManager *trainingManager;
+ (AppDelegate * _Nonnull)instance;
- (CGRect)getScreenFrameForCurrentOrientation;
@end

