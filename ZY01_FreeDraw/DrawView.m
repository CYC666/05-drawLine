//
//  DrawView.m
//  ZY01_FreeDraw
//
//  Created by CYC on 16/6/10.
//  Copyright © 2016年 CaoYicheng. All rights reserved.
//

#import "DrawView.h"
#import "MyBezierPath.h"

@interface DrawView () {

    MyBezierPath *_path;
    NSMutableArray *_paths;
    NSMutableArray *_recoverPaths;
}

@end
@implementation DrawView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self!=nil) {
        _paths = [NSMutableArray array];
        _recoverPaths = [NSMutableArray array];
    }
    return self;
}



//我爱画画
- (void)drawRect:(CGRect)rect {
    SelfSample *selfSample = [SelfSample shareInstance];
    //进行保存
    if (selfSample.isSave == YES) {
        //通过位图上下文获取图片
        UIGraphicsBeginImageContext(self.frame.size);
        for (MyBezierPath *path in _paths) {
            [path.tipColor setStroke];
            path.lineWidth = path.tipSize;
            [path stroke];
        }
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    for (MyBezierPath *path in _paths) {
        [path.tipColor setStroke];
        path.lineWidth = path.tipSize;
        [path stroke];
    }
    //保存之后，要将保存状态置为NO
    selfSample.isSave = NO;
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
}


#pragma mark - 绘制路径
//起点
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    _path = [MyBezierPath bezierPath];
    UITouch *touch = [touches anyObject];
    CGPoint startPoint = [touch locationInView:self];
    [_path moveToPoint:startPoint];
    [_paths addObject:_path];
}
//终点
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [touches anyObject];
    CGPoint stopPoint = [touch locationInView:self];
    [_path addLineToPoint:stopPoint];
    [self setNeedsDisplay];

}

#pragma mark - 画笔设置
- (void)undoPlay {
    if (_paths.count!=0) {
        [_recoverPaths addObject:[_paths lastObject]];
        [_paths removeLastObject];
        [self setNeedsDisplay];
    }
}
- (void)redoPlay {
    if (_recoverPaths.count!=0) {
        [_paths addObject:[_recoverPaths lastObject]];
        [_recoverPaths removeLastObject];
        [self setNeedsDisplay];
    }
}
- (void)clearPlay {
    [_paths removeAllObjects];
    [self setNeedsDisplay];
}
- (void)savePlay {
    [self setNeedsDisplay];
}





@end
