//
//  HLHorizontalPageLayout.h
//  HLHorizontalPageLayoutDemo
//
//  Created by dhl613 on 2018/8/24.
//  Copyright © 2018年 dhl613. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLHorizontalPageLayout : UICollectionViewLayout

/// 最小行间距
@property (nonatomic) CGFloat minimumLineSpacing;
/// 最小列间距
@property (nonatomic) CGFloat minimumInteritemSpacing;
/// item尺寸
@property (nonatomic) CGSize itemSize;
/// collectionView边缘间距
@property (nonatomic) UIEdgeInsets sectionInset;
/// collectionView最小高度 通过行间距item尺寸计算获得
- (CGFloat)getCollectViewHeightWithRowCount:(NSInteger)rowCount;

@end
