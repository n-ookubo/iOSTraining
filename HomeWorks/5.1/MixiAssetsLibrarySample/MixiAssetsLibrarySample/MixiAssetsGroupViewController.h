//
//  MixiAssetsGroupViewController.h
//  MixiAssetsLibrarySample
//
//  Created by 田村 航弥 on 2013/04/24.
//  Copyright (c) 2013年 mixi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface MixiAssetsGroupViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) ALAssetsLibrary *assetsLibrary;
@property (nonatomic, weak)id delegate;
@end
