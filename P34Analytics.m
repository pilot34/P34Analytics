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

static NSString *__eventsCategory = nil;

@implementation P34Analytics

+ (void)startWithId:(NSString *)aId
{
    id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:aId];
    tracker.allowIDFACollection = YES;
    
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSString *iosVersion = [[UIDevice currentDevice] systemVersion];
    [tracker set:[GAIFields customDimensionForIndex:1] value:version];
    [tracker set:[GAIFields customDimensionForIndex:2] value:iosVersion];
}

+ (void)setEventsCategory:(NSString *)category
{
    __eventsCategory = category;
}

+ (void)trackPageView:(NSString *)page
{
    [self trackPageView:page pageTitle:nil];
}

+ (void)trackPageView:(NSString *)page
            pageTitle:(NSString *)title
{
    id tracker = [[GAI sharedInstance] defaultTracker];
    
    GAIDictionaryBuilder *b = [GAIDictionaryBuilder createScreenView];
    [b set:page forKey:kGAIScreenName];
    
    if (title)
        [b set:page forKey:kGAITitle];
    
    [tracker send:[b build]];
}

+ (void)trackEvent:(NSString *)event
            action:(NSString *)action
             value:(NSNumber *)value
{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:__eventsCategory
                                                          action:event ?: @""
                                                           label:action ?: @""
                                                           value:value ?: nil] build]];
}

+ (void)trackEvent:(NSString *)event
{
    [self trackEvent:event action:nil value:nil];
}

+ (void)trackEvent:(NSString *)event action:(NSString *)action
{
    [self trackEvent:event action:action value:nil];
}

@end
