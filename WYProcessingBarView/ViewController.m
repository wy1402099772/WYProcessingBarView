//
//  ViewController.m
//  WYProcessingBarView
//
//  Created by wyan assert on 2016/10/22.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import "ViewController.h"
#import "ProcessingBarView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ProcessingBarView *sub = [[ProcessingBarView alloc] initWithFrame:CGRectMake(0, 100, 300, 4)];
    [self.view addSubview:sub];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
