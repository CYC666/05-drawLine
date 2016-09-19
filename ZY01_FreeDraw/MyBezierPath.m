//
//  MyBezierPath.m
//  ZY01_FreeDraw
//
//  Created by CYC on 16/6/11.
//  Copyright © 2016年 CaoYicheng. All rights reserved.
//

#import "MyBezierPath.h"

@implementation MyBezierPath

- (instancetype)init {

    self = [super init];
    if (self != nil) {
        //创建单例
        SelfSample *selfSample = [SelfSample shareInstance];
        //颜色
        if (selfSample.Color == nil) {
            self.tipColor = [UIColor blackColor];
        } else {
            self.tipColor = selfSample.Color;
        }
        //笔尖大小
        if (selfSample.size == 0) {
            self.tipSize = 10;
        } else {
            self.tipSize = selfSample.size;
        }
        
    }
    return self;
    
}

@end
