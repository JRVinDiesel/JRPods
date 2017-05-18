//
//  Validation.h
//  Neighbour
//
//  Created by 明悦 on 16/1/26.
//  Copyright © 2016年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>

/**数据校验类***/
@interface Validator : NSObject{
}
@property(nonatomic, assign)NSString* errMessage;

+(BOOL) validataWithValue:(NSString*)value regular :(NSString*) expression;
@end
