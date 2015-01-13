//
//  Analytics.h
//  Intuit
//
//  Created by Глеб Тарасов on 25.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface P34Analytics : NSObject

+ (void)startWithId:(NSString *)id;

+ (void)trackPageView:(NSString *)page;

+ (void)trackPageView:(NSString *)page
            pageTitle:(NSString *)title;

+ (void)setEventsCategory:(NSString *)category;

+ (void)trackEvent:(NSString *)event;

+ (void)trackEvent:(NSString *)event
            action:(NSString *)action;

+ (void)trackEvent:(NSString *)event
            action:(NSString *)action
             value:(NSNumber *)value;


@end
