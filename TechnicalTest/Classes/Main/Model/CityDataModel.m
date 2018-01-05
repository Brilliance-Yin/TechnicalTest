//
//  CityDataModel.m
//  TechnicalTest
//
//  Created by Watson on 2018/1/5.
//  Copyright © 2018年 github. All rights reserved.
//

#import "CityDataModel.h"

NSString *const kResponseDescriptionField = @"description";
NSString *const kResponseIdField = @"id";
NSString *const kResponseImage = @"image";
NSString *const kResponseIsPromote = @"is_promote";
NSString *const kResponseTitle = @"title";

@interface CityDataModel ()
@end
@implementation CityDataModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kResponseDescriptionField] isKindOfClass:[NSNull class]]){
        self.descriptionField = dictionary[kResponseDescriptionField];
    }
    if(![dictionary[kResponseIdField] isKindOfClass:[NSNull class]]){
        self.idField = [dictionary[kResponseIdField] integerValue];
    }
    
    if(![dictionary[kResponseImage] isKindOfClass:[NSNull class]]){
        self.image = dictionary[kResponseImage];
    }
    if(![dictionary[kResponseIsPromote] isKindOfClass:[NSNull class]]){
        self.isPromote = [dictionary[kResponseIsPromote] boolValue];
    }
    
    if(![dictionary[kResponseTitle] isKindOfClass:[NSNull class]]){
        self.title = dictionary[kResponseTitle];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.descriptionField != nil){
        dictionary[kResponseDescriptionField] = self.descriptionField;
    }
    dictionary[kResponseIdField] = @(self.idField);
    if(self.image != nil){
        dictionary[kResponseImage] = self.image;
    }
    dictionary[kResponseIsPromote] = @(self.isPromote);
    if(self.title != nil){
        dictionary[kResponseTitle] = self.title;
    }
    return dictionary;
    
}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if(self.descriptionField != nil){
        [aCoder encodeObject:self.descriptionField forKey:kResponseDescriptionField];
    }
    [aCoder encodeObject:@(self.idField) forKey:kResponseIdField];    if(self.image != nil){
        [aCoder encodeObject:self.image forKey:kResponseImage];
    }
    [aCoder encodeObject:@(self.isPromote) forKey:kResponseIsPromote];    if(self.title != nil){
        [aCoder encodeObject:self.title forKey:kResponseTitle];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.descriptionField = [aDecoder decodeObjectForKey:kResponseDescriptionField];
    self.idField = [[aDecoder decodeObjectForKey:kResponseIdField] integerValue];
    self.image = [aDecoder decodeObjectForKey:kResponseImage];
    self.isPromote = [[aDecoder decodeObjectForKey:kResponseIsPromote] boolValue];
    self.title = [aDecoder decodeObjectForKey:kResponseTitle];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    CityDataModel *copy = [CityDataModel new];
    
    copy.descriptionField = [self.descriptionField copy];
    copy.idField = self.idField;
    copy.image = [self.image copy];
    copy.isPromote = self.isPromote;
    copy.title = [self.title copy];
    
    return copy;
}

@end
