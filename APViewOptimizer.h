//
//  APViewOptimizer.h
//  Point2Homes
//
//  Created by Andrei Puni on 5/10/13.
//  Copyright (c) 2013 Point2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APViewOptimizer : NSObject

+ (NSMutableDictionary *)views;
+ (void)scan:(UIView *)view;

@end
