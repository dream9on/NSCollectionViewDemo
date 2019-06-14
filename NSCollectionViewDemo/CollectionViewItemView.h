//
//  CollectionViewItemView.h
//  NSCollectionViewDemo
//
//  Created by Dylan Xiao on 2019/6/12.
//  Copyright © 2019年 Dylan Xiao. All rights reserved.
//


// 1.实现选中效果-->_isSelected

#import <Cocoa/Cocoa.h>

#define ColorWithRGB(colorCode)     [NSColor colorWithDeviceRed:((colorCode>>16)&0xFF)/255.0 green:((colorCode>>8)&0xFF)/255.0 blue:((colorCode)&0xFF)/255.0 alpha:1.0];

#define DEFAULTCOLOR      ColorWithRGB(0x3399FF)

NS_ASSUME_NONNULL_BEGIN
@protocol NSCollectionViewItemViewDelegate <NSObject>

@optional
-(void)showDetailWindow;

@end


@interface CollectionViewItemView : NSView
{
    BOOL _isSelected;
    BOOL _isMouseEntered;
}
@property (nonatomic,assign) id<NSCollectionViewItemViewDelegate> delegate;
@property (nonatomic,assign) BOOL isSelected;
@end

NS_ASSUME_NONNULL_END



/*
 2.添加鼠标监控事件
 一、鼠标点击事件响应流程简述：
 
 1、鼠标硬件先接收到用户点击；
 2、然后交给鼠标驱动来处理，这个驱动是在Mac OS X内核运行的；
 3、处理完就通过 I/O Kit 传递给window server的事件队列。
 4、而window server则负责分派这些事件到对应进程的run-loop。
 二、步骤
 
 1、自定义 MSView 继承自 NSView；
 
 2、在 MSView.m 的 drawRect 方法中添加监控区域NSTrackingArea 和监控样式。
 
 如果NSView不添加 NSTrackingArea，即使实现了监控方法，也不会调用。
 监控区域要使用 dirtyRect，而非 self.frame，否则位置会错误。
 
 - (void)drawRect:(NSRect)dirtyRect {
 [super drawRect:dirtyRect];
 
 NSLog(@"frame：%@ , dirtyRect ： %@",NSStringFromRect([self frame]),NSStringFromRect(dirtyRect));
 //frame：{{100, 100}, {300, 300}} , dirtyRect ： {{0, 0}, {300, 300}}
 
 self.trackingArea = [[NSTrackingArea alloc] initWithRect:dirtyRect
 options:NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved |
 NSTrackingCursorUpdate |
 NSTrackingActiveWhenFirstResponder |
 NSTrackingActiveInKeyWindow |
 NSTrackingActiveInActiveApp |
 NSTrackingActiveAlways |
 NSTrackingAssumeInside |
 NSTrackingInVisibleRect |
 NSTrackingEnabledDuringMouseDrag
 owner:self
 userInfo:nil];
 
 [self addTrackingArea:self.trackingArea];
 [self becomeFirstResponder];
 }
 
 
 跟踪区域选项 NSTrackingAreaOptions
 
 typedef NS_OPTIONS(NSUInteger, NSTrackingAreaOptions) {
 
 NSTrackingMouseEnteredAndExited     = 0x01,//鼠标进入和退出
 NSTrackingMouseMoved                = 0x02,//鼠标移动
 NSTrackingCursorUpdate         = 0x04,    //更新鼠标光标形状
 NSTrackingActiveWhenFirstResponder     = 0x10,    //第一响应者时跟踪所有事件
 NSTrackingActiveInKeyWindow         = 0x20, //应用是key Window时 跟踪所有事件
 NSTrackingActiveInActiveApp     = 0x40,    //应用是激活状态时跟踪所有事件
 NSTrackingActiveAlways         = 0x80,    //跟踪所有事件（鼠标进入/退出/移动)
 
 NSTrackingAssumeInside              = 0x100,
 NSTrackingInVisibleRect             = 0x200,
 NSTrackingEnabledDuringMouseDrag    = 0x400
 };
 
 3、实现监控方法
 
 在 MSView.m 中写下下列方法
 
 
 //鼠标进入追踪区域
 - (void)mouseEntered:(NSEvent *)event{
 //    NSLog(@"mouseEntered ========== ");
 }
 
 //mouseEntered 之后调用
 - (void)cursorUpdate:(NSEvent *)event{
 
 NSLog(@"cursorUpdate ========== ");
 //更改鼠标光标样式
 [[NSCursor resizeUpCursor] set];
 
 }
 
 //鼠标退出追踪区域
 - (void)mouseExited:(NSEvent *)event{
 
 //    NSLog(@"mouseExited ---------- ");
 
 }
 
 
 //鼠标左键按下
 - (void)mouseDown:(NSEvent *)event{
 
 //event.clickCount 不是累计数。双击时调用mouseDown 两次，clickCount 第一次=1，第二次 = 2。
 if ([event clickCount] > 1) {
 //双击相关处理
 }
 
 NSLog(@"mouseDown ========== clickCount：%ld buttonNumber：%ld",event.clickCount,event.buttonNumber);
 
 self.layer.backgroundColor = [NSColor redColor].CGColor;
 
 //获取鼠标点击位置坐标：先获取event发生的window中的坐标，在转换成view视图坐标系的坐标。
 NSPoint eventLocation = [event locationInWindow];
 NSPoint center = [self convertPoint:eventLocation fromView:nil];
 
 //与上面等价
 NSPoint clickLocation = [self convertPoint:[event locationInWindow]
 fromView:nil];
 
 NSLog(@"center：%@ , clickLocation：%@",NSStringFromPoint(center),NSStringFromPoint(clickLocation));
 
 //判断是否按下了Command键
 if ([event modifierFlags] & NSCommandKeyMask) {
 [self setFrameRotation:[self frameRotation]+90.0];
 [self setNeedsDisplay:YES];
 
 NSLog(@"按下了Command键 ------ ");
 }
 }
 
 //鼠标左键起来
 - (void)mouseUp:(NSEvent *)event{
 NSLog(@"mouseUp ========== ");
 
 self.layer.backgroundColor = [NSColor greenColor].CGColor;
 
 }
 
 //鼠标右键按下
 - (void)rightMouseDown:(NSEvent *)event{
 NSLog(@"rightMouseDown ========== ");
 }
 
 //鼠标右键起来
 - (void)rightMouseUp:(NSEvent *)event{
 NSLog(@"rightMouseUp ========== ");
 }
 
 //鼠标移动
 - (void)mouseMoved:(NSEvent *)event{
 //    NSLog(@"mouseMoved ========== ");
 }
 
 //鼠标按住左键进行拖拽
 - (void)mouseDragged:(NSEvent *)event{
 NSLog(@"mouseDragged ========== ");
 }
 
 //鼠标按住右键进行拖拽
 - (void)rightMouseDragged:(NSEvent *)event{
 NSLog(@"rightMouseDragged ========== ");
 }
 ---------------------
 作者：lovechris00
 来源：CSDN
 原文：https://blog.csdn.net/lovechris00/article/details/78021390
 版权声明：本文为博主原创文章，转载请附上博文链接！
 */
