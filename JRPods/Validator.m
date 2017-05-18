//
//  Validation.m
//  Neighbour
//
//  Created by 明悦 on 16/1/26.
//  Copyright © 2016年 ray. All rights reserved.
//

#import "Validator.h"

@implementation Validator
+(BOOL) validataWithValue:(NSString*)value regular :(NSString*) expression{
//    NSString * regex = @"^[A-Za-z0-9]{9,15}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", expression];
    BOOL isMatch = [pred evaluateWithObject:value];
    return isMatch;
}
@end

