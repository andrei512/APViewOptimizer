//
//  APViewOptimizer.m
//  Point2Homes
//
//  Created by Andrei Puni on 5/10/13.
//  Copyright (c) 2013 Point2. All rights reserved.
//

#import "APViewOptimizer.h"
#import "NSObject+Utils.h"

@implementation UIView (APViewOptimizer)

- (void)didAddSubview:(UIView *)subview {
    if ([APViewOptimizer views][self.hashKey] != nil) {
        [APViewOptimizer scan:subview];
    }
}

- (void)didMoveToSuperview {
    if (self.superview == nil &&
        [APViewOptimizer views][self.hashKey] != nil) {
        [[APViewOptimizer views] removeObjectForKey:self.hashKey];
    }
}

@end

float lerp(float x1,float x2,float t) {
    return x1 * (1 - t) + x2 * t;
}

UIColor *interpolateColors(UIColor *c1, UIColor *c2, float t) {
    CGFloat r1 = 0.0, g1 = 0.0, b1 = 0.0, a1 =0.0;
    CGFloat r2 = 0.0, g2 = 0.0, b2 = 0.0, a2 =0.0;
    [c1 getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    [c2 getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    
    return [UIColor colorWithRed:lerp(r1,r2,t)
                           green:lerp(g1,g2,t)
                            blue:lerp(b1,b2,t)
                           alpha:lerp(a1,a2,t)];
}

@implementation APViewOptimizer

+ (NSMutableDictionary *)views {
    static NSMutableDictionary *views = nil;
    if (views == nil) {
        views = [NSMutableDictionary dictionary];
    }
    return views;
}

+ (void)scan:(UIView *)view {
    if ([APViewOptimizer views][view.hashKey] == nil) {
        [APViewOptimizer views][view.hashKey] = view;
        
        for (UIView *subview in view.subviews) {
            [APViewOptimizer scan:subview];
        }
        if (view.opaque == NO) {
            view.backgroundColor = interpolateColors(view.backgroundColor,
                                                     [UIColor redColor],
                                                     0.5);
        }
    }
}

@end
