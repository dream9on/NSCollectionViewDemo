//
//  CollectionViewItemView.m
//  NSCollectionViewDemo
//
//  Created by Dylan Xiao on 2019/6/12.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//

#import "CollectionViewItemView.h"

@implementation CollectionViewItemView
@synthesize isSelected = _isSelected;


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSRect imageRect = NSMakeRect(5,5,self.frame.size.width -10,self.frame.size.height -10);
    NSBezierPath* imageRoundedRectanglePath = [NSBezierPath bezierPathWithRoundedRect:imageRect xRadius: 4 yRadius: 4];
    NSColor* fillColor = nil;
    NSColor* strokeColor = nil;
    //默认是未选中的
    if (_isSelected) {
        fillColor = [NSColor colorWithCalibratedRed: 0.851 green: 0.851 blue: 0.851 alpha: 1];
        strokeColor = [NSColor colorWithCalibratedRed: 0.408 green: 0.592 blue: 0.855 alpha: 1];
    }else{
        fillColor = [NSColor clearColor];
        strokeColor = [NSColor colorWithCalibratedRed: 0.749 green: 0.749 blue: 0.749 alpha: 1];
    }
    [fillColor setStroke];              // 设置边框颜色
    [imageRoundedRectanglePath stroke];  //绘制边框颜色
    
    //    [strokeColor setFill];             //设置填充颜色
    //    [imageRoundedRectanglePath fill];  //填充内部颜色

    NSLog(@"drawRect...");
    // Drawing code here.
}

-(void)setIsSelected:(BOOL)isSelected
{
    _isSelected=isSelected;
    [self setNeedsDisplay:YES];  // UI重绘会重新调用drawRect
}

@end
