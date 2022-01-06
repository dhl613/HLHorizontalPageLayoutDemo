//
//  ViewController.m
//  HLHorizontalPageLayoutDemo
//
//  Created by dhl613 on 2018/8/24.
//  Copyright © 2018年 dhl613. All rights reserved.
//

#import "ViewController.h"
#import "HLHorizontalPageLayout.h"
#import "NumberCollectionViewCell.h"

static NSString *const kCellID = @"NumberCollectionViewCellID";

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView  *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.collectionView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 23;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NumberCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%ld",indexPath.item];
    
    return cell;
}

#pragma mark - Getter
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        
        CGFloat width = self.view.bounds.size.width;
        NSInteger col = 4; // 列数
        
        HLHorizontalPageLayout *layout = [[HLHorizontalPageLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;
        // item宽
        CGFloat itemWidth = (width - 10 * (col-1) - layout.sectionInset.left - layout.sectionInset.right) / col;
        layout.itemSize = CGSizeMake( itemWidth, itemWidth);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, width, [layout getCollectViewHeightWithRowCount:3]) collectionViewLayout:layout];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NumberCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:kCellID];
        _collectionView.backgroundColor = UIColor.redColor;
    }
    return _collectionView;
}

@end
