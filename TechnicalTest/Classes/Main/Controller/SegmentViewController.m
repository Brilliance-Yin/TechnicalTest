//
//  SegmentViewController.m
//  TechnicalTest
//
//  Created by Watson on 2018/1/4.
//  Copyright © 2018年 github. All rights reserved.
//

#import "SegmentViewController.h"
#import "CityViewController.h"
#import "ShopViewController.h"
#import "EatViewController.h"

@interface SegmentViewController ()

@end

@implementation SegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    self.cbs_titleArray = @[@"CITY GUIDE", @"SHOP", @"EAT"];
    self.cbs_viewArray = @[@"CityViewController", @"ShopViewController", @"EatViewController"];
    self.cbs_Type = CBSSegmentHeaderTypeScroll;
    self.cbs_titleColor = SegmentColor;
    self.cbs_titleSelectedColor = SegmentSelectColor;
    self.cbs_bottomLineColor = SegmentSelectColor;
    self.cbs_buttonHeight = 50;
    self.cbs_lineHeight = 5;
    self.cbs_headerColor = kColorWithRGB(249.0, 249.0, 249.0);
    //先设置cbs_titleArray和cbs_viewArray再调用initSegment
    [self initSegment];
}

- (void)createSegmentController {
    
}


- (void)didSelectSegmentIndex:(NSInteger)index {
    NSLog(@"%ld", (long)index);

}

@end
