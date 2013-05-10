//
//  NSObject+Utils.m
//  Point2Homes
//
//  Created by Andrei Puni on 5/10/13.
//  Copyright (c) 2013 Point2. All rights reserved.
//

#import "NSObject+Utils.h"

@implementation NSObject (Utils)

- (NSString *)hashKey {
    return [NSString stringWithFormat:@"%d", (int)self];
}

@end
