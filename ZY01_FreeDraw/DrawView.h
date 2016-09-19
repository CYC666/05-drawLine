//
//  DrawView.h
//  ZY01_FreeDraw
//
//  Created by CYC on 16/6/10.
//  Copyright © 2016年 CaoYicheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView


- (void)undoPlay;
- (void)redoPlay;
- (void)clearPlay;
- (void)savePlay;

@end
