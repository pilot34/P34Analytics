//
//  Analytics.h
//  Intuit
//
//  Created by Глеб Тарасов on 25.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface P34Analytics : NSObject

+ (void)startWithGoogleId:(NSString *)google flurryId:(NSString *)flurryId;
+ (void)startWithId:(NSString *)id;
+ (void)trackPageView:(NSString *)page;

+ (void)trackEvent:(NSString *)event
            action:(NSString *)action;

+ (void)trackEvent:(NSString *)event;

@end
