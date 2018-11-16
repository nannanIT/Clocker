//
//  ClockModel.h
//  ClockView
//
//  Created by Zhengjie Huan on 2018/11/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClockModel : NSObject
@property(nonatomic, copy) NSString *title;
@property(nonatomic, assign) NSInteger timeSpanFromNow;

- (instancetype)initWithTitle:(NSString *)title;

- (instancetype)initWithTitle:(NSString *)title timeSpanFromNow:(NSInteger)timeSpanFromNow;
@end

NS_ASSUME_NONNULL_END
