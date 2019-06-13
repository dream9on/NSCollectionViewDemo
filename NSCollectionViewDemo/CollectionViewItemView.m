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
        strokeColor = [NSColor colorWithCalibratedRed: 0.851 green: 0.851 blue: 0.851 alpha: 1];
    }else{
        strokeColor = [NSColor clearColor];
    }
    [strokeColor setStroke];              // 设置边框颜色
    [imageRoundedRectanglePath stroke];  //绘制边框颜色
    
    if (_isMouseEntered) {
        fillColor = [NSColor colorWithCalibratedRed: 0xFF/255.0 green: 0x99/255.0 blue: 0 alpha: 0.5];
    }else{
        fillColor = [NSColor clearColor];
    }
    [fillColor setFill];             //设置填充颜色
    [imageRoundedRectanglePath fill];  //填充内部颜色

    NSLog(@"drawRect...");
    // Drawing code here.
    
    // 只添加一次监控区域，防止每次刷新UI添加一个
    if(!self.trackingAreas.count)
    {
        // 添加鼠标事件 监控区域
        NSTrackingArea *area =[[NSTrackingArea alloc] initWithRect:dirtyRect
                                                           options:NSTrackingMouseEnteredAndExited|
                                                                   //NSTrackingMouseMoved|
                                                                   //NSTrackingCursorUpdate|
                                                                   NSTrackingActiveAlways|
                                                                   //NSTrackingActiveInActiveApp|
                                                                   //NSTrackingAssumeInside|
                                                                   //NSTrackingInVisibleRect|
                                                                   NSTrackingEnabledDuringMouseDrag
                                                             owner:self
                                                          userInfo:nil];
        [self addTrackingArea:area];
    }
    //[self becomeFirstResponder];
}

-(void)setIsSelected:(BOOL)isSelected
{
    _isSelected=isSelected;
    [self setNeedsDisplay:YES];  // UI重绘会重新调用drawRect
}



-(void)mouseEntered:(NSEvent *)event
{
    [super mouseEntered:event];
    NSLog(@"MouseEntered.");
    _isMouseEntered = YES;
    self.layer.backgroundColor = [NSColor systemYellowColor].CGColor;
    
    [self setNeedsDisplay:YES];
    
    /*  弹出提示
    NSMenu *theMenu = [[NSMenu alloc] initWithTitle:@""];
    NSMenuItem *menuItem = [[NSMenuItem alloc] init];
    menuItem.title = @"Hello";
    [theMenu addItem:menuItem];
    [NSMenu popUpContextMenu:theMenu withEvent:event forView:self];
     */
}

-(void)mouseExited:(NSEvent *)event
{
    NSLog(@"MouseExited.");
    _isMouseEntered = NO;
    self.layer.backgroundColor = [NSColor systemBlueColor].CGColor;
    [self setNeedsDisplay:YES];
}

-(void)mouseMoved:(NSEvent *)event
{
    [super mouseMoved:event];
    NSLog(@"MouseMoved.");
}

-(void)mouseDown:(NSEvent *)event
{
    [super mouseDown:event];
    //event.clickCount 不是累计数。双击时调用mouseDown 两次，clickCount 第一次=1，第二次 = 2。
    if ([event clickCount] > 1) {
        //双击相关处理
        NSLog(@"双击...");
        
        [_delegate showDetailWindow];
        
    }else return;
    
    NSLog(@"mouseDown ========== clickCount：%ld buttonNumber：%ld",event.clickCount,event.buttonNumber);
    self.layer.backgroundColor = [NSColor redColor].CGColor;
    
    //获取鼠标点击位置坐标：先获取event发生的window中的坐标，在转换成view视图坐标系的坐标。
    NSPoint eventLocation = [event locationInWindow];
    NSPoint clickLocation = [self convertPoint:eventLocation fromView:nil];
    NSLog(@"clickLocation：%@",NSStringFromPoint(clickLocation));
    
    //判断是否按下了Command键
    if ([event modifierFlags] & NSEventModifierFlagCommand) {
        [self setFrameRotation:[self frameRotation]+180.0];
        [self setNeedsDisplay:YES];
        
        NSLog(@"按下了Command键 ------ ");
    }
}
@end
