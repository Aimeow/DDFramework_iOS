//
//  DDCommonMethod.m
//  DDFramework
//
//  Created by Aimeow on 7/13/15.
//  Copyright (c) 2015 Aimeow. All rights reserved.
//

#import "DDCommonMethod.h"
#import <sys/socket.h>
#import <sys/sysctl.h>
#import <net/if.h>
#import <net/if_dl.h>
//for idfa
#import <AdSupport/AdSupport.h>
#import "NSString+encode.h"

@implementation DDCommonMethod

+ (NSString * )dd_macString{
    int mib[6];
    size_t len;
    char *buf;
    unsigned char *ptr;
    struct if_msghdr *ifm;
    struct sockaddr_dl *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *macString = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return macString;
}

+ (NSString *)dd_idfaString {
    NSBundle *adSupportBundle = [NSBundle bundleWithPath:@"/System/Library/Frameworks/AdSupport.framework"];
    [adSupportBundle load];
    if (adSupportBundle == nil) {
        return @"";
    }else{
        Class asIdentifierMClass = NSClassFromString(@"ASIdentifierManager");
        if(asIdentifierMClass == nil){
            return @"";
        }
        else{
            ASIdentifierManager *asIM = [[asIdentifierMClass alloc] init];
            if (asIM == nil) {
                return @"";
            }
            else{
                if(asIM.advertisingTrackingEnabled){
                    return [asIM.advertisingIdentifier UUIDString];
                } else{
                    return [asIM.advertisingIdentifier UUIDString];
                }
            }
        }
    }
}

+ (NSString *)dd_idfvString
{
    if([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
        return [[UIDevice currentDevice].identifierForVendor UUIDString];
    }
    return @"";
}

+ (NSString*)dd_deviceVerString
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

+ (NSString *)dd_openUniqueIdentifier
{
    static NSString *uniqueId = nil;
    if (uniqueId==nil) {
        if ([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
            uniqueId = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        } else {
            NSString *macaddress = [DDCommonMethod dd_macString];
            uniqueId= [macaddress md5HexDigest];
        }
        if (uniqueId==nil) {
            uniqueId = [[NSUserDefaults standardUserDefaults] objectForKey:@"random_device_id"];
        }
        if (uniqueId==nil) {
            srandom([[NSDate date] timeIntervalSince1970]);
            uniqueId = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X", (Byte)random(), (Byte)random(), (Byte)random(), (Byte)random(), (Byte)random(), (Byte)random()];
            [[NSUserDefaults standardUserDefaults] setObject:uniqueId forKey:@"random_device_id"];
        }
    }
    return uniqueId;
}

@end
