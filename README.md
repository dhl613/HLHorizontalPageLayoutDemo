# HLHorizontalPageLayoutDemo
UICollectionView 横向布局 分页 cell从左至右排布

# Demo
![效果预览](https://github.com/dhl613/HLHorizontalPageLayoutDemo/blob/master/horizontalPageLayout.gif) <br>

# 使用方法
``` Objective-C
    CGFloat width = self.view.bounds.size.width;
    NSInteger col = 4; // 列数
        
    HLHorizontalPageLayout *layout = [[HLHorizontalPageLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    // 所有item宽高保持一致
    CGFloat itemWidth = (width - 10 * (col-1) - layout.sectionInset.left - layout.sectionInset.right) / col;
    layout.itemSize = CGSizeMake( itemWidth, itemWidth);

    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, width, itemWidth * 3 + 20) collectionViewLayout:layout];
    _collectionView.pagingEnabled = YES;
    _collectionView.showsVerticalScrollIndicator = NO;
```

# 横向布局核心代码
``` Objective-C
// 计算itemframe
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attri = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    NSInteger item = indexPath.item;
    NSInteger pageNumber = item / (self.rowCount * self.columnCount);
    
    NSInteger itemInPage = item % (self.rowCount * self.columnCount);
    
    NSInteger col = itemInPage % self.columnCount;
    NSInteger row = itemInPage / self.columnCount;
    
    CGFloat x = self.sectionInset.left + (self.itemSize.width + self.minimumInteritemSpacing)*col + pageNumber * self.collectionView.bounds.size.width;
    CGFloat y = self.sectionInset.top + (self.itemSize.height + self.minimumLineSpacing)*row ;
    
    attri.frame = CGRectMake(x, y, self.itemSize.width, self.itemSize.height);
  
    return attri;
}
// 根据itemSize lineSpacing sectionInsets collectionView frame计算取得
- (NSInteger)rowCount {
    if (_rowCount == 0) {
        
        NSInteger numerator = self.collectionView.bounds.size.height - self.sectionInset.top - self.sectionInset.bottom + self.minimumLineSpacing;
        NSInteger denominator = self.minimumLineSpacing + self.itemSize.height;
        NSInteger count = numerator/denominator;
        _rowCount = count;
        
        // minimumLineSpacing itemSize.height不是刚好填满 将多出来的补给minimumLineSpacing
        if (numerator % denominator) {
            self.minimumLineSpacing = (self.collectionView.bounds.size.height - self.sectionInset.top-self.sectionInset.bottom - count * self.itemSize.height) / (CGFloat)(count - 1);
        }
    }
    return _rowCount;
}
// 根据itemSize minimumInteritemSpacing sectionInsets collectionView frame计算取得
- (NSInteger)columnCount {
    if (_columnCount == 0) {
        
        NSInteger numerator = self.collectionView.bounds.size.width - self.sectionInset.left - self.sectionInset.right + self.minimumInteritemSpacing;
        NSInteger denominator = self.minimumInteritemSpacing + self.itemSize.width;
        NSInteger count = numerator/denominator;
        _columnCount = count;
        
        // minimumInteritemSpacing itemSize.width不是刚好填满 将多出来的补给minimumInteritemSpacing
        if (numerator % denominator) {
            self.minimumInteritemSpacing = (self.collectionView.bounds.size.width - self.sectionInset.left - self.sectionInset.right - count * self.itemSize.width) / (CGFloat)(count - 1);
        }
    }
    return _columnCount;
}
```

# License
HLHorizontalPageLayoutDemo is licensed under the MIT license.[(http://opensource.org/licenses/MIT)](http://opensource.org/licenses/MIT)<br>
