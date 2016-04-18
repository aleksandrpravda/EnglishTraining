//
//  Word.h
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/18/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject<NSCoding>
@property (nonatomic, strong, nonnull) NSString *text;
@property (nonatomic, strong, nonnull) NSString *translation;
@property (nonnull, strong, nonatomic) NSString *transcription;
- (nonnull instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary;
@end
