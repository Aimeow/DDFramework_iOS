//
//  DDBannerModel.h
//  DDFramework
//
//  Created by Aimeow on 7/13/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import "DDModel.h"
#import "DDBannerEntity.h"

@interface DDBannerModel : DDModel

/**
 *  @author Aimeow, 2015-07-14
 *
 *  DDBannerEntity 的数组,用于首页banner展示
 */
@property (nonatomic , strong) NSMutableArray *bannerArray;

/**
 *  @author Aimeow, 2015-07-14
 *
 *  isSubBanner默认为NO
 */
@property (nonatomic , assign) BOOL isSubBanner;

@end
