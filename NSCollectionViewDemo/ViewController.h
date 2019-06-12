//
//  ViewController.h
//  NSCollectionViewDemo
//
//  Created by Dylan Xiao on 2019/6/12.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController<NSCollectionViewDelegate,NSCollectionViewDataSource>
{
    NSMutableArray *datasource;
}
- (IBAction)Btn_Click:(NSButton *)sender;

@property (weak) IBOutlet NSCollectionView *collectionView;

@end

