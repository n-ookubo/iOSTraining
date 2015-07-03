//
//  main.m
//  MixiSample
//
//  Created by n_ookubo on 2015/07/03.
//  Copyright (c) 2015年 n_ookubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MixiSampleClass.h"
#import "NSString+HogeAddition.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        MixiSampleClass *mixi = [[MixiSampleClass alloc] initWithName:@"foo" sampleType:SampleTypeFuga];
        
        NSLog(@"%@ name=%@ [name addHoge]=%@", mixi, mixi.name, [mixi.name addHoge]);
        NSLog(@"\n[\"fuga\" addHoge]=%@", [@"fuga" addHoge]);
    }
    return 0;
}
