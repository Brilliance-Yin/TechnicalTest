//
//  CityDataModel.h
//  TechnicalTest
//
//  Created by Watson on 2018/1/5.
//  Copyright © 2018年 github. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityDataModel : NSObject

@property (nonatomic, strong) NSString * descriptionField;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) BOOL isPromote;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
