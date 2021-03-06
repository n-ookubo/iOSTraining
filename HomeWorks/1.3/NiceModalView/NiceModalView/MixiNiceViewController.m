//
//  MixiNiceViewController.m
//  NiceModalView
//
//  Created by 鄭 基旭 on 2013/04/15.
//  Copyright (c) 2013年 鄭 基旭. All rights reserved.
//

#import "MixiNiceViewController.h"
#import "MyUINavigationController.h"
#import "UIViewController+NiceAnimation.h"

@interface MixiNiceViewController()
@end

@implementation MixiNiceViewController
static NSMutableDictionary *instanceDictionary;

- (int)getInstanceIdentifier
{
    static dispatch_once_t onceDispather;
    dispatch_once(&onceDispather, ^{
        instanceDictionary = [[NSMutableDictionary alloc] init];
    });
    
    NSString *instancePointerString = [[NSString alloc] initWithFormat:@"%p", self];
    NSNumber *identifier = [instanceDictionary objectForKey:instancePointerString];
    if (identifier != nil) {
        return identifier.intValue;
    }
    
    static int counter = 0;
    
    identifier = [[NSNumber alloc] initWithInt:counter++];
    [instanceDictionary setObject:identifier forKey:instancePointerString];
    return identifier.intValue;
}

- (void)myLog:(NSString *)format,...
{
    va_list args;
    va_start(args, format);
    NSString *content = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    NSLog(@"<%d> %@", [self getInstanceIdentifier], content);
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
    
    self.title = [[NSString alloc] initWithFormat:@"%d", [self getInstanceIdentifier]];
// TODO: XIB上にある二つの各ボタンのTouchUpInsideイベントに　clickModalView：　と　clickPush:　を連結しましょう
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    [self myLog:@"didReceiveMemoryWarning"];
}

- (NSString *)getAppearingStatusString
{
    NSString *cause = @"";
    
    if ([self isMovingFromParentViewController]){
        cause = [cause stringByAppendingString:@" (removed from parent)"];
    }
    if ([self isMovingToParentViewController]) {
        cause = [cause stringByAppendingString:@" (add to parent)"];
    }
    if ([self isBeingPresented]) {
        cause = [cause stringByAppendingString:@" (presented)"];
    }
    if ([self isBeingDismissed]) {
        cause = [cause stringByAppendingString:@" (dismissed)"];
    }
    
    return cause;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self myLog:@"viewWillAppear:%@", [self getAppearingStatusString]];
    
    // TODO : UIViewController+NiceAnimation にある関数を使って、いい感じの遷移になるようにしましょう
    [self animationPopFront];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self myLog:@"viewDidAppear:%@", [self getAppearingStatusString]];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self myLog:@"viewWillDisappear:%@", [self getAppearingStatusString]];
 }

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self myLog:@"viewDidDisappear:%@", [self getAppearingStatusString]];
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
    if ([_delegate respondsToSelector:(@selector(callback:))]) {
        [_delegate callback:self];
    }
 
    [self myLog:@"dealloc"];
    [instanceDictionary removeObjectForKey:[[NSString alloc] initWithFormat:@"%p", self]];
}

- (IBAction)clickPush:(id)sender
{
	MixiNiceViewController *viewController = [[MixiNiceViewController alloc] init];
    viewController.delegate = self;
// TODO :　hint-> pushViewController: animation:
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)clickModalView:(id)sender
{
	MixiNiceViewController *viewController = [[MixiNiceViewController alloc] init];
    viewController.delegate = self;

// TODO :　hint-> presentViewController: animation:
    MyUINavigationController *navController = [[MyUINavigationController alloc] initWithRootViewController:viewController];
    navController.logger = viewController;
    [self presentViewController:navController animated:YES completion:nil];

    // TODO : UIViewController+NiceAnimation にある関数を使って、いい感じの遷移になるようにしましょう
    [self animationPushBack];

}

- (void)clickClose:(id)sender
{
// TODO : hint-> dismissViewControllerAnimated:
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) callback:(id<MyLogger>)sender
{
    NSLog(@"delegate <%d> from <%d>", [self getInstanceIdentifier], [sender getInstanceIdentifier]);
}

@end
