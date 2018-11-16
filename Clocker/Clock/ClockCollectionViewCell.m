//
//  ClockCollectionViewCell.m
//  ClockView
//
//  Created by Zhengjie Huan on 2018/11/16.
//

#import "ClockCollectionViewCell.h"
#import "ClockView.h"

@interface ClockCollectionViewCell ()
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) ClockView *clockView;
@end

@implementation ClockCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel = ({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.numberOfLines = 1;
            label.textAlignment = NSTextAlignmentCenter;
            label.backgroundColor = [UIColor orangeColor];
            label.font = [UIFont boldSystemFontOfSize:18];
            label;
        });
        
        [self.contentView addSubview:self.titleLabel];
        
        self.clockView = ({
            ClockView *view = [[ClockView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
            view.backgroundColor = [UIColor clearColor];
            [view setClockBackgroundImage:[UIImage imageNamed:@"clock-background.png"].CGImage];
            [view setHourHandImage:[UIImage imageNamed:@"clock-hour-background.png"].CGImage];
            [view setMinHandImage:[UIImage imageNamed:@"clock-min-background.png"].CGImage];
            [view setSecHandImage:[UIImage imageNamed:@"clock-sec-background.png"].CGImage];
            [view setSecHandContinuos:YES];
            view;
        });
        [self.contentView addSubview:self.clockView];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutWithClockModel:(ClockModel *)clockModel {
    self.titleLabel.text = clockModel.title;
    self.titleLabel.frame = CGRectMake(0, 0, self.frame.size.width, 30);
    self.clockView.frame = CGRectMake(0, 30, 200, 200);
    self.clockView.timeSpanFromNow = clockModel.timeSpanFromNow;
    [self.clockView start];
}

@end
