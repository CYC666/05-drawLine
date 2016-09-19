//
//  ViewController.m
//  ZY01_FreeDraw
//
//  Created by CYC on 16/6/10.
//  Copyright © 2016年 CaoYicheng. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
#import "SelfSample.h"

@interface ViewController () {
    DrawView *_drawView;
    SelfSample *_selfSample;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //单例
    _selfSample = [SelfSample shareInstance];
    //绘画视图
    _drawView = [[DrawView alloc] initWithFrame:CGRectMake(0, 60, 375, 520)];
    _drawView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_drawView];
    
}

//撤销
- (IBAction)undoAction:(id)sender {
    [_drawView undoPlay];
}
//重做
- (IBAction)redo:(id)sender {
    [_drawView redoPlay];
}
//橡皮擦
- (IBAction)eraserAction:(id)sender {
    _selfSample.Color = [UIColor whiteColor];
}
//清除
- (IBAction)clearAction:(id)sender {
    [_drawView clearPlay];
}
//保存
- (IBAction)saveAction:(id)sender {
    _selfSample.isSave = YES;
    [_drawView savePlay];
}
//改变笔尖大小
- (IBAction)sliderAction:(UISlider *)sender {
    _selfSample.size = sender.value;
}
#pragma mark - 画笔颜色
- (IBAction)redColor:(id)sender {
    _selfSample.Color = [UIColor redColor];
}
- (IBAction)yellowColor:(id)sender {
    _selfSample.Color = [UIColor yellowColor];
}
- (IBAction)greenColor:(id)sender {
    _selfSample.Color = [UIColor greenColor];
}
- (IBAction)skyBlueColor:(id)sender {
    _selfSample.Color = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
}
- (IBAction)deepBlueColor:(id)sender {
    _selfSample.Color = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
}
- (IBAction)pinkColor:(id)sender {
    _selfSample.Color = [UIColor colorWithRed:1 green:0 blue:1 alpha:1];
}
- (IBAction)greyColor:(id)sender {
    _selfSample.Color = [UIColor grayColor];
}
- (IBAction)blackColor:(id)sender {
    _selfSample.Color = [UIColor blackColor];
}





















@end
