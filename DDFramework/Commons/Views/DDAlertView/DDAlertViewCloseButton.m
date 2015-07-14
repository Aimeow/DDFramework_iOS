//
//  DDAlertViewCloseButton.m
//  DDFramework
//
//  Created by Aimeow on 7/10/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import "DDAlertViewCloseButton.h"



 @interface DDAlertViewCloseButton()
 
 @property (nonatomic , assign) CGFloat size;
 @property (nonatomic , strong) UIColor *color;
 
 @end
 
 
 @implementation DDAlertViewCloseButton
 
- (instancetype)init
{
    self = [self initWithSize:10 withColor:[UIColor blackColor]];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithSize : (CGFloat)size withColor : (UIColor *)color
{
    self = [super initWithFrame:CGRectMake(0, 0, size, size)];
    if (self) {
        self.size = size;
        self.color = color;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGFloat size = self.size;
    
    //// Bezier 3 Drawing
    UIBezierPath* bezier1Path = UIBezierPath.bezierPath;
    [bezier1Path moveToPoint: CGPointMake(0, 0)];
    [bezier1Path addLineToPoint: CGPointMake(size, size)];
    [self.color setStroke];
    bezier1Path.lineWidth = 1;
    [bezier1Path stroke];
    
    
    //// Bezier 4 Drawing
    UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
    [bezier2Path moveToPoint: CGPointMake(size, 0)];
    [bezier2Path addLineToPoint: CGPointMake(0, size)];
    [self.color setStroke];
    bezier2Path.lineWidth = 1;
    [bezier2Path stroke];
}

 
 @end
