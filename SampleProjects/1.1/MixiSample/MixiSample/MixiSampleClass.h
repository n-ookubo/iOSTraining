//
//  MisiSampleClass.h
//  MixiSample
//
//  Created by n_ookubo on 2015/07/03.
//  Copyright (c) 2015年 n_ookubo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SampleType) {
    SampleTypeHoge = 0,
    SampleTypeFuga,
    SampleTypePiyo
};

@interface MixiSampleClass : NSObject

@property (nonatomic, strong) NSString *name;

-(id)initWithName:(NSString *)name sampleType:(SampleType)sampleType;
+(NSString *) getStaticString;

@end