//
//  Utils.h
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/18/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_INLINE NSString* loc(NSString* key) {
    return [[NSBundle mainBundle] localizedStringForKey:key value:key table:nil];
}

@interface Utils : NSObject
+ (NSString *)safeString:(id)obj;
+ (NSString *)safeString:(id)obj withDefValue:(NSString *)defValue;
+ (double)safeDouble:(id)obj;
+ (double)safeDouble:(id)obj withDefValue:(float)defValue;
+ (float)safeFloat:(id)obj;
+ (float)safeFloat:(id)obj withDefValue:(float)defValue;
+ (int)safeInt:(id)obj;
+ (int)safeInt:(id)obj withDefValue:(int)defValue;
+ (BOOL)safeBool:(id)obj;
+ (BOOL)safeBool:(id)obj withDefValue:(BOOL) defValue;
+ (long long int)safeLongLong:(id)obj;
+ (unsigned long long int)safeUnsignedLongLong:(id)obj;
+ (NSDictionary *)safeDictionary:(id)obj;
+ (NSDictionary *)safeDictionary:(id)obj withDefValue:(NSDictionary *)defValue;
+ (NSArray *)safeArray:(id)obj;
@end
