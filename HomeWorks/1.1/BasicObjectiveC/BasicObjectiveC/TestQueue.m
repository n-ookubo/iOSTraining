//
//  TestQueue.m
//  BasicObjectiveC
//
//  Created by n_ookubo on 2015/07/03.
//  Copyright (c) 2015年 武田 祐一. All rights reserved.
//

#import "TestQueue.h"

@interface TestQueue ()

@end

@implementation TestQueue
-(void)push:(id)object
{
    [collection addObject:object];
}
@end