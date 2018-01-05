//
//  CItyGuideCell.m
//  TechnicalTest
//
//  Created by Watson on 2018/1/4.
//  Copyright © 2018年 github. All rights reserved.
//

#import "CItyGuideCell.h"

@implementation CItyGuideCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _smallImage = [[UIImageView alloc] init];
        _smallImage.contentMode = UIViewContentModeScaleToFill;
        _smallImage.image = [UIImage imageNamed:@"5.jpg"];

        _titleLabel = [[UILabel alloc] init];

        _describeLabel = [[UILabel alloc] init];
        _describeLabel.textColor = kColorWithRGB(199.0, 199.0, 199.0);
        _describeLabel.font = [UIFont systemFontOfSize:14];
        _describeLabel.numberOfLines = 0;

        _bigImage = [[UIImageView alloc] init];
        _bigImage.contentMode = UIViewContentModeScaleAspectFit;
        _bigImage.image = [UIImage imageNamed:@"5.jpg"];
        
        NSArray *views = @[_smallImage,_titleLabel,_describeLabel,_bigImage];
        [self.contentView sd_addSubviews:views];
       
        [_smallImage sd_layout];
        _smallImage.sd_layout.topEqualToView(self.contentView).leftSpaceToView(self.contentView, 5).widthIs(0.4*ScreenWidth).heightIs(0.32*ScreenWidth);
        
        _titleLabel.sd_layout.leftSpaceToView(_smallImage, 10).rightSpaceToView(self.contentView, 15).topEqualToView(self.contentView).heightIs(30);
        _describeLabel.sd_layout.leftEqualToView(_titleLabel).rightEqualToView(_titleLabel).topSpaceToView(self.contentView, 0.16*ScreenWidth).heightIs(66);
        _bigImage.sd_layout.leftEqualToView(self.contentView).rightEqualToView(self.contentView).topEqualToView(self.contentView).heightIs(0.8*ScreenWidth);
        
        [self setFrame];

    }
    return self;
}

- (void)setFrame {
//    [_smallImage sd_layout];
//    _smallImage.sd_layout.topEqualToView(self.contentView).leftSpaceToView(self.contentView, 5).widthIs(0.4*ScreenWidth).heightIs(0.32*ScreenWidth);
//
//    _titleLabel.sd_layout.leftSpaceToView(_smallImage, 10).rightSpaceToView(self.contentView, 15).topEqualToView(self.contentView).heightIs(30);
//    _describeLabel.sd_layout.leftEqualToView(_titleLabel).rightEqualToView(_titleLabel).topSpaceToView(self.contentView, 0.16*ScreenWidth).heightIs(66);
//    _bigImage.sd_layout.leftEqualToView(self.contentView).rightEqualToView(self.contentView).topEqualToView(self.contentView).heightIs(0.8*ScreenWidth);
    
    NSLog(@"%f%f",_smallImage.image.size.width,_smallImage.image.size.height);
    
}

- (void)setSprView:(UIView *)sprView {
    _sprView = sprView;
}

- (void)setModel:(CityDataModel *)model {
    _model = model;
    if(model.isPromote == YES) {
        _bigImage.hidden = NO;
        
        _smallImage.hidden = YES;
        _titleLabel.hidden = YES;
        _describeLabel.hidden= YES;
        
//        [_bigImage sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"5.jpg"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//            [MBProgressHUD hideAllHUDsForView:_sprView animated:YES];
//        }];
        [_bigImage sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"5.jpg"]];
        
        [self setupAutoHeightWithBottomView:_bigImage bottomMargin:0];
    }else {
        _bigImage.hidden = YES;
        
        _smallImage.hidden = NO;
        _titleLabel.hidden = NO;
        _describeLabel.hidden= NO;
        
        _titleLabel.text = model.title;
        _describeLabel.text = model.descriptionField;
        
//        [_smallImage sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"5.jpg"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//            [MBProgressHUD hideAllHUDsForView:_sprView animated:YES];
//        }];
        [_smallImage sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"5.jpg"]];

        [self setupAutoHeightWithBottomView:_smallImage bottomMargin:0];
    }
    
    
    
    NSLog(@"%@",model);
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
