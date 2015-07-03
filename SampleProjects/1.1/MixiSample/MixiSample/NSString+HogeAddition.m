//
//  NSString+HogeAddition.m
//  MixiSample
//
//  Created by n_ookubo on 2015/07/03.
//  Copyright (c) 2015年 n_ookubo. All rights reserved.
//

#import "NSString+HogeAddition.h"

@implementation NSString (HogeAddition)

-(NSString *)addHoge
{
    return [NSString stringWithFormat:@"%@hoge", self];
}

@end
