//
//  TestStack.m
//  BasicObjectiveC
//
//  Created by n_ookubo on 2015/07/03.
//  Copyright (c) 2015年 武田 祐一. All rights reserved.
//

#import "TestStack.h"

@interface TestStack ()
@end

@implementation TestStack
-(void)push:(id)object
{
    [collection insertObject:object
                     atIndex:0];
}

@end