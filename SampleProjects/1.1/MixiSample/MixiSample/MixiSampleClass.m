//
//  MisiSampleClass.m
//  MixiSample
//
//  Created by n_ookubo on 2015/07/03.
//  Copyright (c) 2015年 n_ookubo. All rights reserved.
//

#import "MixiSampleClass.h"

static const NSString *constString = @"const";
static const NSString *staticString = @"static";

@interface MixiSampleClass ()

@property (nonatomic, assign) BOOL isEnabled;
@property (nonatomic, assign) SampleType sampleType;

@end

@implementation MixiSampleClass
-(id)initWithName:(NSString *)name
       sampleType:(SampleType)sampleType
{
    self = [super init];
    if (self) {
        _name = name;
        _isEnabled = YES;
        _sampleType = sampleType;
    }
    return self;
}

+(NSString *)getStaticString
{
    return (NSString *)staticString;
}
@end