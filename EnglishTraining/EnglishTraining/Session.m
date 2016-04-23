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
- (void)loadQuestions:(NSArray *)array completion:(void(^)(NSArray *questions, NSError *error))completion {
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://dictionary.skyeng.ru/api/v1/wordtasks?meaningIds=%@", [self trainingDataParams:array]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [self loadDataWIthRequest:request success:^(id response) {
        NSArray *questions = [Utils safeArray:response];
        completion(questions, nil);
    } fail:^(NSError *error) {
        completion(nil, error);
    }];
}


- (void)loadDataWIthRequest:(NSURLRequest *)URLRequest success:(void(^)(id response))success fail:(void(^)(NSError *error))fail {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:URLRequest completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            fail(error);
        } else {
            success(responseObject);
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