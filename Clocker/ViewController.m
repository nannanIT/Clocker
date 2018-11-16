//
//  ViewController.m
//  Clocker
//
//  Created by Zhengjie Huan on 2018/11/16.
//  Copyright © 2018 Zhengjie Huan. All rights reserved.
//

#import "ViewController.h"
#import "ClockCollectionViewCell.h"
#import "ClockModel.h"
#import "ClockView.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic, strong) ClockView *clockView;
@property(nonatomic, strong) UICollectionView *clockCollectionView;
@property(nonatomic, strong) NSMutableArray *clockArray;
@end

@implementation ViewController

- (instancetype)init {
    if (self = [super init]) {
        self.clockView = ({
            ClockView *view = [[ClockView alloc] initWithFrame:CGRectMake(30, 64, 200, 200)];
            view.backgroundColor = [UIColor clearColor];
            view;
        });
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    self.clockCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.clockCollectionView.backgroundColor = [UIColor whiteColor];
    self.clockCollectionView.delegate = self;
    self.clockCollectionView.dataSource = self;
    [self.clockCollectionView registerClass:[ClockCollectionViewCell class] forCellWithReuseIdentifier:@"clockCollectionViewCell"];
    [self.view addSubview:self.clockCollectionView];
    
    self.clockArray = [NSMutableArray array];
    ClockModel *modelA = [[ClockModel alloc] initWithTitle:@"beijing"];
    ClockModel *modelB = [[ClockModel alloc] initWithTitle:@"one" timeSpanFromNow:(3600)];
    
    ClockModel *modelC = [[ClockModel alloc] initWithTitle:@"two" timeSpanFromNow:(3600 * 2)];
    ClockModel *modelD = [[ClockModel alloc] initWithTitle:@"three" timeSpanFromNow:(3600 * 3)];
    ClockModel *modelE = [[ClockModel alloc] initWithTitle:@"four" timeSpanFromNow:(3600 * 4)];
    ClockModel *modelF = [[ClockModel alloc] initWithTitle:@"five" timeSpanFromNow:(3600 * 5)];
    ClockModel *modelG = [[ClockModel alloc] initWithTitle:@"four" timeSpanFromNow:(3600 * 6)];
    ClockModel *modelH = [[ClockModel alloc] initWithTitle:@"five" timeSpanFromNow:(3600 * 7)];
    [self.clockArray addObject:modelA];
    [self.clockArray addObject:modelB];
    [self.clockArray addObject:modelC];
    [self.clockArray addObject:modelD];
    [self.clockArray addObject:modelE];
    [self.clockArray addObject:modelF];
    [self.clockArray addObject:modelG];
    [self.clockArray addObject:modelH];
    [self.clockCollectionView reloadData];
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.clockArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *clockCollectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"clockCollectionViewCell" forIndexPath:indexPath];
    ClockModel *model = [self.clockArray objectAtIndex:indexPath.row];
    [(ClockCollectionViewCell *)clockCollectionCell layoutWithClockModel:model];
    return clockCollectionCell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.bounds.size.width / 2 - 5, 230);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 10, 0);
}

@end
