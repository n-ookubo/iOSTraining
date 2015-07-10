//
//  NIMModalViewController.m
//  NavigationInModal
//
//  Created by 武田 祐一 on 2013/04/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "NIMModalViewController.h"

@interface NIMModalViewController ()

@end

@implementation NIMModalViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = [NSString stringWithFormat:@"%d", (unsigned int)self.navigationController.viewControllers.count];

    // TODO ここに navigation bar の右上をpushするボタンを配置するコードを書く;
    UIBarButtonItem *pushButton = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStyleBordered target:self action:@selector(pushViewController)];
    self.navigationItem.rightBarButtonItem = pushButton;
    // TODO さらに、一番先頭に戻るボタンを左に配置する
    if (self.navigationController.viewControllers.count > 1) {
        UIBarButtonItem *popButton = [[UIBarButtonItem alloc] initWithTitle:@"root" style:UIBarButtonItemStyleBordered target:self action:@selector(popToRootViewController)];
        self.navigationItem.leftBarButtonItem = popButton;
    }
    self.navigationItem.leftItemsSupplementBackButton = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController
{
    [self.navigationController pushViewController:[[NIMModalViewController alloc] initWithNibName:@"NIMModalViewController" bundle:nil] animated:YES];
}

- (void)popToRootViewController
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
