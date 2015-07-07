//
//  MixiNiceViewController.h
//  NiceModalView
//
//  Created by 鄭 基旭 on 2013/04/15.
//  Copyright (c) 2013年 鄭 基旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TestDelegate <NSObject>
- (void) callback:(id<TestDelegate>)sender;
- (int) getInstanceIdentifier;
@end

@interface MixiNiceViewController : UIViewController<TestDelegate>
@property (weak, nonatomic) id<TestDelegate> delegate;
@end
