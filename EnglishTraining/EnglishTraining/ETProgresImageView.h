//
//  ETProgresImageView.h
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/24/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETProgresImageView : UIImageView
- (void)setProgressImage:(UIImage *)image;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;
@end
