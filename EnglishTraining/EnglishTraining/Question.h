//
//  Question.h
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"
@interface Question : NSObject<NSCoding>
@property(nonatomic, strong, nonnull) Word * word;
@property(nonatomic, strong, nonnull) NSString *audioURL;
@property(nonatomic, strong, nonnull) NSString *imageUrl;
@property(nonatomic, strong, nonnull) NSString *identifire;
@property(nonnull, strong, nonatomic) NSString *definition;
@property(nonatomic, strong, nonnull) NSMutableArray *alternatives;
- (nonnull instancetype)initWithCoder:(nonnull NSCoder *)aDecoder;
- (nonnull instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary;
@end
