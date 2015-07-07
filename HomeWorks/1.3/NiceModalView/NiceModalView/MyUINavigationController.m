//
//  UINavigationController+MyLogging.m
//  NiceModalView
//
//  Created by n_ookubo on 2015/07/07.
//  Copyright (c) 2015年 鄭 基旭. All rights reserved.
//

#import "MyUINavigationController.h"

@implementation MyUINavigationController
- (NSString *)getAppearingStatusString
{
    NSString *cause = @"";
    
    if ([self isMovingFromParentViewController]){
        cause = [cause stringByAppendingString:@" (removed from parent)"];
    }
    if ([self isMovingToParentViewController]) {
        cause = [cause stringByAppendingString:@" (add to parent)"];
    }
    if ([self isBeingPresented]) {
        cause = [cause stringByAppendingString:@" (presented)"];
    }
    if ([self isBeingDismissed]) {
        cause = [cause stringByAppendingString:@" (dismissed)"];
    }
    
    if (cause.length > 0) {
        return cause;
    }
    
    return nil;
}
- (void) logAppearingCause:(NSString *)method
{
    NSString *cause = [self getAppearingStatusString];
    if (cause) {
        [_logger myLog:@"(nav) %@:%@", method, cause];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self logAppearingCause:@"viewWillAppear"];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self logAppearingCause:@"viewDidAppear"];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self logAppearingCause:@"viewWillDisappear"];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self logAppearingCause:@"viewDidDisappear"];
}
@end