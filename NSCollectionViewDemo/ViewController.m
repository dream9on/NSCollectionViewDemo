//
//  ViewController.m
//  NSCollectionViewDemo
//
//  Created by Dylan Xiao on 2019/6/12.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewItem.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    datasource = [NSMutableArray array];
    
    [self.collectionView setSelectable:YES];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section NS_AVAILABLE_MAC(10_11);
{
    return datasource.count;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_MAC(10_11);
{
    //NSCollectionViewItem *item = [collectionView makeItemWithIdentifier:@"CollectionViewItem" forIndexPath:indexPath];
    
    NSCollectionViewItem *item = [datasource objectAtIndex:indexPath.item];
    // reload 时取消选中效果
    [(CollectionViewItem *)item setSelected:NO];
    [(CollectionViewItem *)item setInfo:[NSString stringWithFormat:@"%ld",indexPath.item]];
    return item;
}

- (IBAction)Btn_Click:(NSButton *)sender {
    
    CollectionViewItem *item = [[CollectionViewItem alloc] init];
    //item.info = @"Info";
    [datasource addObject:item];
    
    [self.collectionView reloadData];
}
@end
