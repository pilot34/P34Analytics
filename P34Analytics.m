//
//  Analytics.m
//  Intuit
//
//  Created by Глеб Тарасов on 25.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "P34Analytics.h"

#import <GoogleAnalytics-iOS-SDK/GAITracker.h>
#import <GoogleAnalytics-iOS-SDK/GAI.h>
#import <GoogleAnalytics-iOS-SDK/GAIDictionaryBuilder.h>
#import <GoogleAnalytics-iOS-SDK/GAIFields.h>

@implementation P34Analytics

+ (void)startWithId:(NSString *)aId
{
    id tracker = [[GAI sharedInstance] trackerWithTrackingId:aId];
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSString *iosVersion = [[UIDevice currentDevice] systemVersion];
    [tracker set:[GAIFields customDimensionForIndex:1] value:version];
    [tracker set:[GAIFields customDimensionForIndex:2] value:iosVersion];
}

+ (void)trackPageView:(NSString *)page
{
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName
           value:page];
    
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

+ (void)trackEvent:(NSString *)event
            action:(NSString *)action
{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:event ?: @"event"
                                                          action:action ?: @"action"
                                                           label:nil
                                                           value:nil] build]];
}

+ (void)trackEvent:(NSString *)event
{
    [self trackEvent:event action:event];
}


@end
