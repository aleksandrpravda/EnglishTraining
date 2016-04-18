//
//  Utils.m
//  EnglishTraining
//
//  Created by Alexander Rogachev on 4/18/16.
//  Copyright © 2016 Alexander Rogachev. All rights reserved.
//

#import "Utils.h"

@implementation Utils
+ (NSString *)safeString:(id)obj {
    return [Utils safeString:obj withDefValue:@""];
}

+ (NSString *)safeString:(id)obj withDefValue:(NSString *)defValue {
    if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return [(NSNumber*)obj stringValue];
    } else {
        return defValue;
    }
}

+ (double)safeDouble:(id)obj {
    return [Utils safeDouble:obj withDefValue:0.0];
}

+ (double)safeDouble:(id)obj withDefValue:(float)defValue {
    if ([obj isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)obj;
        return str.length > 0 ? [str doubleValue] : defValue;
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)obj doubleValue];
    } else {
        return defValue;
    }
}

+ (float)safeFloat:(id)obj {
    return [Utils safeFloat:obj withDefValue:0.0f];
}

+ (float)safeFloat:(id)obj withDefValue:(float)defValue {
    if ([obj isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)obj;
        return str.length > 0 ? [str floatValue] : defValue;
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)obj floatValue];
    } else {
        return defValue;
    }
}

+ (int)safeInt:(id)obj {
    return [Utils safeInt:obj withDefValue:0];
}

+ (int)safeInt:(id)obj withDefValue:(int)defValue {
    if ([obj isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)obj;
        return str.length > 0 ? [str intValue] : 0;
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)obj intValue];
    } else {
        return defValue;
    }
}

+ (BOOL)safeBool:(id)obj{
    return [self safeBool:obj withDefValue:NO];
}

+ (BOOL)safeBool:(id)obj withDefValue:(BOOL) defValue{
    if ([obj isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)obj;
        return str.length > 0 ? [str isEqualToString:@"1"] ||
        [str.lowercaseString isEqualToString:@"true"] ||
        [str.lowercaseString isEqualToString:@"yes"]
        : defValue;
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)obj intValue] > 0;
    } else {
        return defValue;
    }
}

+ (long long int)safeLongLong:(id)obj {
    if ([obj isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)obj;
        return str.length > 0 ? [(NSString *)obj longLongValue] : 0;
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)obj longLongValue];
    } else {
        return 0;
    }
}

+ (unsigned long long int)safeUnsignedLongLong:(id)obj {
    return (unsigned long long int)[Utils safeLongLong:obj];
}

+ (NSDictionary *)safeDictionary:(id)obj {
    return [Utils safeDictionary:obj withDefValue:nil];
}

+ (NSDictionary *)safeDictionary:(id)obj withDefValue:(NSDictionary *)defValue {
    return [obj isKindOfClass:[NSDictionary class]] ? (NSDictionary*)obj : defValue;
}

+ (NSArray *)safeArray:(id)obj {
    return [obj isKindOfClass:[NSArray class]] ? (NSArray *)obj : nil;
}
@end
