//
//  TestCollection.m
//  BasicObjectiveC
//
//  Created by n_ookubo on 2015/07/03.
//  Copyright (c) 2015年 武田 祐一. All rights reserved.
//

#import "TestCollection.h"

@interface TestCollection ()

@end

@implementation TestCollection
-(instancetype)init
{
    self = [super init];
    if (self){
        collection = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSString *)description
{
    return [collection description];
}

-(id) pop
{
    if (collection.count > 0){
        id element = collection[0];
        [collection removeObjectAtIndex:0];
        return element;
    }
    return nil;
}

-(NSInteger) size
{
    return collection.count;
}
@end