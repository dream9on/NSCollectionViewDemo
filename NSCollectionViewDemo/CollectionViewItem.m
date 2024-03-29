//
//  CollectionViewItem.m
//  NSCollectionViewDemo
//
//  Created by Dylan Xiao on 2019/6/12.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

#import "CollectionViewItem.h"


@interface CollectionViewItem ()

@end

@implementation CollectionViewItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor systemBlueColor].CGColor;
    [(CollectionViewItemView *)(self.view) setDelegate:self];
    
    //_detailWindowController = [[DetailWindowController alloc] initWithWindowNibName:@"DetailWindowController"];
    _detailWindowController = [[DetailWindowController alloc] init];
    detailWindowDataSource = [NSMutableArray array];
    
    [detailWindowDataSource addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys: @1,@"ID",
                                                                                         @"ITEM1",@"ITEM",
                                                                                         @"0.5",@"LowerLimit",
                                                                                         @"999",@"UpperLimit", nil]];
    _detailWindowController.dataSource =detailWindowDataSource;
     
    NSLog(@"collectionViewItem viewDidLoad....");
}

- (IBAction)Btn_Start:(NSButton *)sender {
    self.lbl_label1.intValue++;
    _detailWindowController.lbl_info.stringValue = [NSString stringWithFormat:@"Info ID :%@",_info];
}

-(void)setSelected:(BOOL)selected
{
    [(CollectionViewItemView *)[self view] setIsSelected:selected];
    
    [super setSelected:selected];
}

-(void)showDetailWindow
{
    NSLog(@"show Detail window.");
    
    //[detailWindowController showWindow:self];
    [_detailWindowController.window makeKeyAndOrderFront:self];
}

@end
