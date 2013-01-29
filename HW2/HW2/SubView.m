//
//  SubView.m
//  HW2
//
//  Created by Kraig McKernan on 1/27/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import "SubView.h"

@interface SubView () {
    NSInteger pattern; //the pattern number
}

@end

@implementation SubView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setPatternWithNumber:1];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    //Code for storyboard initiated views
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setPatternWithNumber:0];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [[UIColor whiteColor] setStroke];
    if (pattern == 0){
        [self setBackgroundColor:[UIColor blackColor]];
        for (int j = 0; j < 5; j++) {
            for (int i = 0; i < 5; i++) {
                UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(i*30, j*30, 30, 30)];
                path.lineWidth = 1.5;
                [path stroke];
            }
        }
    } else if (pattern == 1){
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 0)];
        [path addLineToPoint:CGPointMake(20, 20)];
        [path addLineToPoint:CGPointMake(80, 20)];
        [path addLineToPoint:CGPointMake(100, 0)];
        [path moveToPoint:CGPointMake(0, 100)];
        [path addLineToPoint:CGPointMake(20, 80)];
        [path addLineToPoint:CGPointMake(80, 80)];
        [path addLineToPoint:CGPointMake(100, 100)];
        [path moveToPoint:CGPointMake(20, 20)];
        [path addLineToPoint:CGPointMake(20, 80)];
        [path moveToPoint:CGPointMake(80, 20)];
        [path addLineToPoint:CGPointMake(80, 80)];
        [path stroke];
    } else if (pattern == 2) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 20)];
        [path addLineToPoint:CGPointMake(0, 80)];
        [path addQuadCurveToPoint:CGPointMake(20, 100) controlPoint:CGPointMake(0, 100)];
        [path addLineToPoint:CGPointMake(80, 100)];
        [path addQuadCurveToPoint:CGPointMake(100, 80) controlPoint:CGPointMake(100, 100)];
        [path addLineToPoint:CGPointMake(100, 20)];
        [path addQuadCurveToPoint:CGPointMake(80, 0) controlPoint:CGPointMake(100, 0)];
        [path addLineToPoint:CGPointMake(20, 0)];
        [path addQuadCurveToPoint:CGPointMake(0, 20) controlPoint:CGPointMake(0, 0)];
        [path stroke];
    }
}



-(void)setPatternWithNumber:(NSInteger)number {
    pattern = number;
    [self setNeedsDisplay];
}


@end
