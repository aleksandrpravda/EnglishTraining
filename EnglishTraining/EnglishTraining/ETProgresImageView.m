//
//  ETProgresImageView.m
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/24/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import "ETProgresImageView.h"

@implementation ETProgresImageView {
    UIImageView *_progressImageView;
}

- (void)setProgressImage:(UIImage *)image {
    _progressImageView = [[UIImageView alloc] initWithImage:image];
    _progressImageView.frame = CGRectMake(0, 0, 0, self.frame.size.height);
    _progressImageView.contentMode = UIViewContentModeLeft;
    [_progressImageView setClipsToBounds:YES];
    [self addSubview:_progressImageView];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated {
    CGFloat w = progress*self.frame.size.width;
    if (animated) {
        [UIView animateWithDuration:0.5f animations:^{
            _progressImageView.frame = CGRectMake(0, _progressImageView.frame.origin.y, w, self.frame.size.height);
        }];
    }else {
        _progressImageView.frame = CGRectMake(0, _progressImageView.frame.origin.y, w, self.frame.size.height);
    }
}

- (CGPathRef)pathForMask {
    return CGPathCreateWithRect(CGRectMake(0, 0, _progressImageView.frame.size.width, _progressImageView.frame.size.height), nil);
}

@end
