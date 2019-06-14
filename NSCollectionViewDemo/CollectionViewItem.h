//
//  CollectionViewItem.h
//  NSCollectionViewDemo
//
//  Created by Dylan Xiao on 2019/6/12.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//




/*
 说明：
 1.CollectionViewItem需要设置AutoResizing 四个方向，否则会出现window窗口尺寸改变，item布局混乱
 
 */

#import <Cocoa/Cocoa.h>
#import "CollectionViewItemView.h"
#import "DetailWindowController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewItem : NSCollectionViewItem<NSCollectionViewItemViewDelegate>
{
    DetailWindowController *detailWindowController;
    NSMutableArray *detailWindowDataSource;         // detailWindow's datasource
}

@property (assign)NSString * info;
@property (weak) IBOutlet NSTextField *lbl_label1;
- (IBAction)Btn_Start:(NSButton *)sender;

@property (assign) DetailWindowController *detailWindowController;
@end

NS_ASSUME_NONNULL_END
