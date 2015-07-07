//
//  MixiNiceViewController.h
//  NiceModalView
//
//  Created by 鄭 基旭 on 2013/04/15.
//  Copyright (c) 2013年 鄭 基旭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLogger.h"

@protocol TestDelegate <NSObject>
- (void) callback:(id<MyLogger>)sender;
@end

@interface MixiNiceViewController : UIViewController<TestDelegate, MyLogger>
@property (weak, nonatomic) id<TestDelegate, MyLogger> delegate;
@end
