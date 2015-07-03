//
//  TestQueue.h
//  BasicObjectiveC
//
//  Created by n_ookubo on 2015/07/03.
//  Copyright (c) 2015年 武田 祐一. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestCollection : NSObject
{
    @protected
    NSMutableArray *collection;
}
-(void)push:(id)object;
-(id)pop;
-(NSInteger)size;
@end