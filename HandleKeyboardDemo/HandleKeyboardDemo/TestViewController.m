//
//  TestViewController.m
//  HandleKeyboardDemo
//
//  Created by Alexander on 2018/6/20.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()<UITextFieldDelegate>

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	
	UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(100, 400, 250, 40)];
	textfield.delegate = self;
	textfield.placeholder = @"输入点什么东西";
	textfield.borderStyle = UITextBorderStyleRoundedRect;
	[self.bgScrollView addSubview:textfield];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
