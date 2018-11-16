//
//  ClockCollectionViewCell.h
//  ClockView
//
//  Created by Zhengjie Huan on 2018/11/16.
//

#import <UIKit/UIKit.h>
#import "ClockModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClockCollectionViewCell : UICollectionViewCell

- (void)layoutWithClockModel:(ClockModel *)clockModel;

@end

NS_ASSUME_NONNULL_END
