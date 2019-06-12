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
    self.view.layer.backgroundColor = [NSColor systemRedColor].CGColor;
    
   // self.lbl_label1.stringValue = _info;
}

- (IBAction)Btn_Start:(NSButton *)sender {
    self.lbl_label1.intValue++;
}
@end
