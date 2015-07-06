//
//  EFMViewController.m
//  EternalForceModal
//
//  Created by 武田 祐一 on 2013/04/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "EFMViewController.h"

@interface EFMViewController ()
{
    EFMSecondViewController *secondViewController;
    BOOL eternalModal;
}
@end

@implementation EFMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    secondViewController = nil;
    eternalModal = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {

    secondViewController = [[EFMSecondViewController alloc] initWithNibName:@"EFMSecondViewController" bundle:nil];
    // TODO secondViewControllerのdelegateを自分にセット
    secondViewController.delegate = self;
    // TODO [self presentViewController:￼ animated:￼ completion:￼] を呼ぶ
    [self.view.window.rootViewController presentViewController:secondViewController animated:YES completion:nil];
}

#pragma EMFSecondViewController delegate
// TODO EFMSecondViewController の delegateメソッドを実装
- (void)closeModal {
    if (secondViewController) {
        [secondViewController dismissViewControllerAnimated:YES completion:^(void) {
            if (eternalModal) {
                [self.view.window.rootViewController presentViewController:secondViewController animated:YES completion:nil];
            }
            eternalModal = YES;
        }];
    }
}


@end
