//
//  CItyGuideCell.h
//  TechnicalTest
//
//  Created by Watson on 2018/1/4.
//  Copyright © 2018年 github. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityDataModel.h"

@interface CItyGuideCell : UITableViewCell

@property (nonatomic, strong) UIImageView * smallImage;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * describeLabel;
@property (nonatomic, strong) UIImageView * bigImage;

@property (nonatomic, strong) CityDataModel * model;
@property (nonatomic, strong) UIView * sprView;

@end
