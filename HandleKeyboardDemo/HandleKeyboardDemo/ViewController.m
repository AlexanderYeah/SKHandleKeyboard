//
//  ViewController.m
//  HandleKeyboardDemo
//
//  Created by Alexander on 2018/6/20.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "ViewController.h"

#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)goToTestVC:(id)sender {

	TestViewController *testVC = [[TestViewController alloc]init];
	[self presentViewController:testVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
