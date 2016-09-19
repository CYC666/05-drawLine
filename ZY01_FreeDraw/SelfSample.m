//
//  SelfSample.m
//  ZY01_FreeDraw
//
//  Created by CYC on 16/6/11.
//  Copyright © 2016年 CaoYicheng. All rights reserved.
//

#import "SelfSample.h"

static SelfSample *instance = nil;

@implementation SelfSample

+ (instancetype)shareInstance {

    if (instance == nil) {
        instance = [[SelfSample alloc] init];
    }
    return instance;

}

//下面的代码打开后会出现野指针
//+ (instancetype)allocWithZone:(struct _NSZone *)zone {
//
//    if (instance == nil) {
//        instance = [SelfSample allocWithZone:zone];
//    }
//    return instance;
//
//}

- (id)copy {

    return self;

}

@end
