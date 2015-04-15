//
//  UIView+HideFunction.h
//  tukejiApp
//
//  Created by a on 15/1/20.
//  Copyright (c) 2015年 lookfeel. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    HideFunctionFourGrid = 4,
    HideFunctionNineGrid = 9,
    HideFunctionSixteenGrid = 16
} HideFunctionGridType;


@interface UIView (HideFunction)

@property(nonatomic,strong) NSMutableString *pwdStr;

@property(nonatomic,assign)HideFunctionGridType gridType;

-(void)addHideFunction:(void (^)())successCallBack;

@end
