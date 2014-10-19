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

+ (void)startWithId:(NSString *)id
{
    [[GAI sharedInstance] trackerWithTrackingId:id];
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
