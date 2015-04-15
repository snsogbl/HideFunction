//
//  ViewController.m
//  HideFunction
//
//  Created by a on 15/4/15.
//  Copyright (c) 2015年 a. All rights reserved.
//

#import "ViewController.h"
#import "UIView+HideFunction.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view setGridType:HideFunctionFourGrid];
    [self.view addHideFunction:^{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"开启隐藏功能" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }];
    
    float _x = 0.0;
    float _y = 0.0;
    int rowCount = sqrtf(self.view.gridType);
    float _w = self.view.frame.size.width/rowCount;
    float _h = self.view.frame.size.height/rowCount;
    
    for (int i=0; i<self.view.gridType; i++) {
        _x = (i%rowCount)*_w;
        _y = ((int)(i/rowCount))*_h;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(_x, _y, _w, _h)];
        [view setBackgroundColor:[UIColor colorWithRed:floatRand() green:floatRand() blue:floatRand() alpha:floatRand()]];
        [self.view addSubview:view];
        
        UILabel *lable = [[UILabel alloc] init];
        [lable setFont:[UIFont systemFontOfSize:24]];
        [lable setText:[NSString stringWithFormat:@"%d",i+1]];
        [lable sizeToFit];
        [lable setCenter:CGPointMake(view.frame.size.width/2.0, view.frame.size.height/2.0)];
        [view addSubview:lable];
        
        
    }
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setText:@"密码1234,手势向上滑"];
    [titleLabel sizeToFit];
    [titleLabel setCenter:CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0)];
    [self.view addSubview:titleLabel];
}

float floatRand(){
    return random()/(float)RAND_MAX;
}

@end
