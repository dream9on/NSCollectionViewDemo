//
//  CollectionViewItemView.h
//  NSCollectionViewDemo
//
//  Created by Dylan Xiao on 2019/6/12.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//


// 实现选中效果

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewItemView : NSView
{
    BOOL _isSelected;
}
@property (nonatomic,assign) BOOL isSelected;
@end

NS_ASSUME_NONNULL_END
