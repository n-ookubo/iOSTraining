//
//  MixiNiceViewController.m
//  NiceModalView
//
//  Created by 鄭 基旭 on 2013/04/15.
//  Copyright (c) 2013年 鄭 基旭. All rights reserved.
//

#import "MixiNiceViewController.h"
#import "UIViewController+NiceAnimation.h"

@interface MixiNiceViewController()
@end

@implementation MixiNiceViewController
- (void)myLog:(NSString *)format,...
{
    va_list args;
    va_start(args, format);
    NSString *content = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    NSLog(@"<%p> %@", self, content);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self myLog:@"initWithNibName"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // ios7対応
    float iosVer = [UIDevice currentDevice].systemVersion.floatValue;
    if (iosVer >= 7.0f) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }

    NSInteger allImageCount = 5;
// なぜ NSArrayじゃなくて　NSMutableArray か？　違いを探してみましょう
    NSMutableArray *sampleImages = [NSMutableArray array];
    for (int currentIndex = 0; currentIndex < allImageCount; currentIndex++)
    {
        NSString *filename = [NSString stringWithFormat:@"%d.jpg", currentIndex];
        UIImage *img = [UIImage imageNamed:filename];
        [sampleImages addObject:img];
    }

	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close"
                                                                              style:UIBarButtonItemStyleBordered
                                                                             target:self
                                                                             action:@selector(clickClose:)];

	static int index;
	index++;

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[sampleImages objectAtIndex:index%allImageCount]];
    // insertSubview と addSubViewの違いを探してみましょう
	[self.view insertSubview:imageView atIndex:0];
    
    [self myLog:@"viewDidLoad (imageIndex=%d)", index];
    

// TODO: XIB上にある二つの各ボタンのTouchUpInsideイベントに　clickModalView：　と　clickPush:　を連結しましょう
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self myLog:@"viewWillAppear"];
    
    // TODO : UIViewController+NiceAnimation にある関数を使って、いい感じの遷移になるようにしましょう
    [self animationPopFront];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self myLog:@"viewDidAppear"];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self myLog:@"viewWillDisappear"];
 }

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self myLog:@"viewDidDisappear"];
}
/*
- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self myLog:@"viewWillLayoutSubviews"];
}

- (void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self myLog:@"viewDidLayoutSubviews"];
}
*/
- (void) dealloc
{
    [self myLog:@"dealloc"];
}

- (IBAction)clickPush:(id)sender
{
	MixiNiceViewController *viewController = [[MixiNiceViewController alloc] init];
// TODO :　hint-> pushViewController: animation:
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)clickModalView:(id)sender
{
	MixiNiceViewController *viewController = [[MixiNiceViewController alloc] init];

// TODO :　hint-> presentViewController: animation:
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self presentViewController:navController animated:YES completion:nil];

    // TODO : UIViewController+NiceAnimation にある関数を使って、いい感じの遷移になるようにしましょう
    [self animationPushBack];

}

- (void)clickClose:(id)sender
{
// TODO : hint-> dismissViewControllerAnimated:
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
