//
//  DDBannerEntity.h
//  DDFramework
//
//  Created by Aimeow on 7/13/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDBannerEntity : NSObject

@property (nonatomic , strong) NSString *bannerId;
@property (nonatomic , strong) NSString *data;
@property (nonatomic , strong) NSString *image;
@property (nonatomic , strong) NSString *image_url;
@property (nonatomic , strong) NSString *name;
@property (nonatomic , assign) NSInteger timeout;
@property (nonatomic , strong) NSString *type;

@end
