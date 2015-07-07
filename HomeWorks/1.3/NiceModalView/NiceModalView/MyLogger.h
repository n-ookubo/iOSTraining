//
//  MyLogger.h
//  NiceModalView
//
//  Created by n_ookubo on 2015/07/07.
//  Copyright (c) 2015年 鄭 基旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyLogger<NSObject>
- (int) getInstanceIdentifier;
- (void) myLog:(NSString *)format,...;
@end