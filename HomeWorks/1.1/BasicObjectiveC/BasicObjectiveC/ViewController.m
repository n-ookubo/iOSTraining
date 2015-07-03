//
//  ViewController.m
//  BasicObjectiveC
//
//  Created by 武田 祐一 on 2013/04/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "ViewController.h"
#import "TestQueue.h"
#import "TestStack.h"

@interface ViewController ()

@end

@implementation ViewController

+(void)log:(id)object
{
    NSLog(@"\n%@", object);
}

+(void)pushAndLog:(TestCollection *)collection
            value:(id)object
{
    [collection push:object];
    NSLog(@"\npush %@ -> %@", object, collection);
}

+(id)popAndLog:(TestCollection *)collection
{
    id result = [collection pop];
    NSLog(@"\npop %@ -> %@", collection, result);
    return result;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // TODO ここに課題を書き進めていってください
    NSDictionary *dic1 = @{@"domain" : @"mixi.jp", @"entry":@[@"list_voice.pl", @"list_diary.pl", @"list_mymall_item.pl"]};
    NSDictionary *dic2 = @{@"domain" : @"mmail.jp", @"entry" : @[@{@"path" : @"add_diary.pl", @"query" : @[@{@"tag_id" : @7}]}]};
    NSDictionary *dic3 = @{@"domain" :  @"itunes.apple.com"};
    
    NSArray *array = @[dic1, dic2, dic3];
    NSLog(@"\n%@", array);
    
    //キューのテスト
    TestQueue *queue = [[TestQueue alloc] init];
    [ViewController pushAndLog:queue value:@0];
    [ViewController pushAndLog:queue value:@1];
    [ViewController pushAndLog:queue value:@2];
    [ViewController popAndLog:queue];
    [ViewController pushAndLog:queue value:@3];
    [ViewController pushAndLog:queue value:@4];
    [ViewController popAndLog:queue];
    [ViewController popAndLog:queue];
    
    //スタックのテスト
    TestStack *stack = [[TestStack alloc] init];
    [ViewController pushAndLog:stack value:@0];
    [ViewController pushAndLog:stack value:@1];
    [ViewController pushAndLog:stack value:@2];
    [ViewController popAndLog:stack];
    [ViewController pushAndLog:stack value:@3];
    [ViewController pushAndLog:stack value:@4];
    [ViewController popAndLog:stack];
    [ViewController popAndLog:stack];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
