//
//  ClockModel.m
//  ClockView
//
//  Created by Zhengjie Huan on 2018/11/15.
//

#import "ClockModel.h"

@implementation ClockModel

- (instancetype)initWithTitle:(NSString *)title {
    return [self initWithTitle:title timeSpanFromNow:0];
}

- (instancetype)initWithTitle:(NSString *)title timeSpanFromNow:(NSInteger)timeSpanFromNow {
    if (self = [super init]) {
        self.title = title;
        self.timeSpanFromNow = timeSpanFromNow;
    }
    return self;
}

@end
