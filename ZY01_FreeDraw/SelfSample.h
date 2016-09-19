//
//  SelfSample.h
//  ZY01_FreeDraw
//
//  Created by CYC on 16/6/11.
//  Copyright © 2016年 CaoYicheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SelfSample : NSObject

@property (strong, nonatomic) UIColor *Color;
@property (assign, nonatomic) float size;
@property (assign, nonatomic) BOOL isSave;

+ (instancetype)shareInstance;

@end
