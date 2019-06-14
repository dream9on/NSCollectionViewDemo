//
//  DetailWindowController.m
//  NSCollectionViewDemo
//
//  Created by Dylan Xiao on 2019/6/13.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

/*
 
 */


#import "DetailWindowController.h"

@interface DetailWindowController ()

@end

@implementation DetailWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    self.lbl_info.stringValue = [NSString stringWithFormat:@"Info ID: %@",_info];
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return self.dataSource.count;
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row;
{
    return [_dataSource[row] objectForKey:tableColumn.identifier];
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(nullable id)object forTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row;
{
    NSLog(@"%@,",object);
    [_dataSource[row] setObject:object forKey:tableColumn.identifier];
        
    NSMutableDictionary *item = [_dataSource[row] mutableCopy];
    [item setObject:object forKey:tableColumn.identifier];
    [_dataSource replaceObjectAtIndex:row withObject:item];
}


-(void)windowWillClose:(NSNotification *)notification
{
    NSLog(@"window will close");
    //[NSApp stopModal];
}

@end
