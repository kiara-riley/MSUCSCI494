//
//  SubView.m
//  HW2
//
//  Created by Kraig McKernan on 1/27/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import "SubView.h"

@interface SubView ()

@end

@implementation SubView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor blackColor]];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    //Code for storyboard initiated views
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [[UIColor whiteColor] setStroke];
    if ([self pattern] == 0){
        
        for (int j = 0; j < 5; j++) {
            for (int i = 0; i < 5; i++) { //not really "efficient" but it works pretty fast still
                UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(i*20, j*20, 20, 20)];
                path.lineWidth = 1.5;
                [path stroke];
            }
        }
    } else if ([self pattern] == 1){ // makes a square thingy
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
    } else if ([self pattern] == 2) { // makes a rounded rectangle
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



-(void)setPattern:(NSInteger)pattern { // overide the property method
    _pattern = pattern;
    [self setNeedsDisplay]; //need to redraw or nothing happens
}


@end
