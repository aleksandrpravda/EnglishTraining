//
//  Session.m
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/17/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import "Session.h"
#import "AppDelegate.h"
#import <AFNetworking.h>
#import "Utils.h"
#import "Training.h"

@implementation Session
- (void)loadTrainingData:(NSArray *)array completion:(void(^)(Training *training))completion {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://dictionary.skyeng.ru/api/v1/wordtasks?meaningIds=%@", [self trainingDataParams:array]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSArray *array = [Utils safeArray:responseObject];
            Training *training = [[Training alloc] initWithQuestions:array];
            completion(training);
        }
    }];
    [dataTask resume];
}

- (NSString *)trainingDataParams:(NSArray *)array {
    NSString *qIDs = [array componentsJoinedByString:@","];
    NSString *param = [NSString stringWithFormat:@"%@&width=%f", qIDs, [[AppDelegate instance] getScreenFrameForCurrentOrientation].size.width];
    return param;
}
@end
