//
//  DetailWindowController.h
//  NSCollectionViewDemo
//
//  Created by Dylan Xiao on 2019/6/13.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// 问题是如何释放 DetailWindowController... 

NS_ASSUME_NONNULL_BEGIN

@interface DetailWindowController : NSWindowController<NSTableViewDelegate,NSTableViewDataSource,NSWindowDelegate>
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet NSTextField *lbl_info;
@property (weak) IBOutlet NSTextField *lbl_Time;
@property (unsafe_unretained) IBOutlet NSTextView *logView;
@property (nonatomic,assign) NSString *info;

@end

NS_ASSUME_NONNULL_END
