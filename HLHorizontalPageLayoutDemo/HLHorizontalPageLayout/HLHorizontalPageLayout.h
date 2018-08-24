//
//  HLHorizontalPageLayout.h
//  HLHorizontalPageLayoutDemo
//
//  Created by dhl613 on 2018/8/24.
//  Copyright © 2018年 dhl613. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLHorizontalPageLayout : UICollectionViewLayout

@property (nonatomic) CGFloat minimumLineSpacing;
@property (nonatomic) CGFloat minimumInteritemSpacing;
@property (nonatomic) CGSize itemSize;
@property (nonatomic) UIEdgeInsets sectionInset;

@end
