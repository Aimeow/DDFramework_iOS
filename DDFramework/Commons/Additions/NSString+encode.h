//
//  NSString+encode.h
//  DDFramework
//
//  Created by Aimeow on 7/13/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (encode)

- (NSString *)URIEncoded;
- (NSString *)URIComponentEncoded;
- (NSString *)md5HexDigest;

@end
