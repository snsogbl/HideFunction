//
//  UIView+HideFunction.m
//  tukejiApp
//
//  Created by a on 15/1/20.
//  Copyright (c) 2015年 lookfeel. All rights reserved.
//

#import "UIView+HideFunction.h"

static char PWDSTR;
static char GridTypeStr;
static char SuccessCallback;

//配置密码
#define HIDE_FUNCTION_OPEN_KEY @"1234"

@implementation UIView (HideFunction)

-(NSMutableString *)pwdStr{
    return  objc_getAssociatedObject(self, &PWDSTR);
}

-(void)setPwdStr:(NSMutableString *)pwdStr{
    objc_setAssociatedObject(self, &PWDSTR, pwdStr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(HideFunctionGridType)gridType{
    return (HideFunctionGridType)[objc_getAssociatedObject(self, &GridTypeStr) integerValue];
}

-(void)setGridType:(HideFunctionGridType)gridType{
   objc_setAssociatedObject(self, &GridTypeStr, [NSNumber numberWithInt:gridType], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(void)addHideFunction:(void (^)())successCallBack{
    objc_setAssociatedObject(self, &SuccessCallback, successCallBack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (!self.gridType) {
        self.gridType = HideFunctionFourGrid;
    }
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPressed:)];
    [tapRecognizer setNumberOfTouchesRequired:1];
    [self addGestureRecognizer:tapRecognizer];
    
    UISwipeGestureRecognizer *swiperecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [swiperecognizer setDirection:UISwipeGestureRecognizerDirectionUp];
    [self addGestureRecognizer:swiperecognizer];
    
    self.pwdStr = [[NSMutableString alloc] init];
}

-(void)tapPressed:(UITapGestureRecognizer*)recognizer{
    CGPoint point = [recognizer locationInView:self];
    int index = [self transformPoint:point];
    
    [self.pwdStr appendString:[NSString stringWithFormat:@"%d",index]];
}

-(void)handleSwipeFrom:(UISwipeGestureRecognizer*)recognizer{
    if (recognizer.direction == UISwipeGestureRecognizerDirectionUp && [self.pwdStr isEqualToString:HIDE_FUNCTION_OPEN_KEY]) {
        void(^block)(void)  = objc_getAssociatedObject(self, &SuccessCallback);
        block();
    }
}

-(int)transformPoint:(CGPoint)point{
    int index = -1;
    int rowCount = sqrt(self.gridType);
    float _w = self.frame.size.width/rowCount;
    float _h = self.frame.size.height/rowCount;
    
    int row = point.y/_h;
    int line = point.x/_w;
    
    index = row*rowCount+line;
    return index+1;
}

@end
