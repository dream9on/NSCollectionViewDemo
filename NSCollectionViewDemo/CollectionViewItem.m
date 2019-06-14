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
    
    @autoreleasepool {
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor systemBlueColor].CGColor;
    [(CollectionViewItemView *)(self.view) setDelegate:self];
    
    detailWindowController = [[DetailWindowController alloc] initWithWindowNibName:@"DetailWindowController"];
    detailWindowDataSource = [NSMutableArray array];
    
    [detailWindowDataSource addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@1,@"ID",@"ITEM1",@"ITEM", nil]];
    detailWindowController.dataSource =detailWindowDataSource;
     
    NSLog(@"viewDidLoad....");
    }
}

- (IBAction)Btn_Start:(NSButton *)sender {
    self.lbl_label1.intValue++;
    
    detailWindowController.lbl_info.stringValue = [NSString stringWithFormat:@"Info ID :%@",_info];
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
    [detailWindowController.window makeKeyAndOrderFront:self];
}

-(void)dealloc
{
    NSLog(@"Collection view item dealloc");
}


@end
