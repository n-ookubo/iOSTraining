//
//  ThumbnailsViewController.m
//  ThumbnailFocus
//
//  Created by 鄭 基旭 on 2013/04/18.
//  Copyright (c) 2013年 鄭 基旭. All rights reserved.
//

#import "ThumbnailsViewController.h"

@interface ThumbnailsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViewCollection;
@property (strong, nonatomic) FocusManager *focusManager;
@end

@implementation ThumbnailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.focusManager = [[FocusManager alloc] init];
    self.focusManager.delegate = self;
    
    // iPadではTableViewを使わないので手動で読み込む
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        for (int i = 0; i < _imageViewCollection.count; i++) {
            UIImageView *view = [_imageViewCollection objectAtIndex:i];
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i + 1]];
            view.image = image;
            view.tag = i + 1;
            
            [self.focusManager installOnView:view];
        }
    }
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

#pragma mark - FocusDelegate
- (UIViewController *)parentViewControllerForFocusManager
{
    return self.parentViewController;
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [self.focusManager installOnView:cell.imageView];
    }
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", indexPath.row + 1]];
    cell.imageView.image = image;
    cell.imageView.tag = indexPath.row + 1;

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
@end
