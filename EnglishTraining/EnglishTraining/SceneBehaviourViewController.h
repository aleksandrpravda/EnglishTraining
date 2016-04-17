//
//  SceneVehaviour.h
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ObserverDelegate <NSObject>
- (void)behaviourFinished;
@end

@interface SceneBehaviourViewController : UIViewController
@property(nullable, assign) id <ObserverDelegate> delegate;
- (void)start;
- (void)finish;
- (void)pouse;
@end
