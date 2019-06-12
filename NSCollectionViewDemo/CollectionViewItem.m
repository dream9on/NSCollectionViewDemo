//
//  CollectionViewItem.m
//  NSCollectionViewDemo
//
//  Created by Dylan Xiao on 2019/6/12.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

#import "CollectionViewItem.h"
#import "CollectionViewItemView.h"

@interface CollectionViewItem ()

@end

@implementation CollectionViewItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor systemBlueColor].CGColor;
    
    NSLog(@"viewDidLoad....");
    // self.lbl_label1.stringValue = _info;
}

- (IBAction)Btn_Start:(NSButton *)sender {
    self.lbl_label1.intValue++;
}

-(void)setSelected:(BOOL)selected
{
    [(CollectionViewItemView *)[self view] setIsSelected:selected];
    
    [super setSelected:selected];
}
@end
