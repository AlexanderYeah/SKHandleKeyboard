//
//  BaseViewController.m
//  HandleKeyboardDemo
//
//  Created by Alexander on 2018/6/20.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIScrollViewDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}

#pragma mark - 0 Lazyload
- (UIScrollView *)bgScrollView
{
	if (!_bgScrollView) {
		_bgScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
		_bgScrollView.delegate = self;
		_bgScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
		_bgScrollView.userInteractionEnabled = YES;
		[self.view addSubview:_bgScrollView];
	}
	return _bgScrollView;
	
}



#pragma mark - 1 LifeCycle
- (void)createUI
{
	// 添加键盘监听事件
	
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
	
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
	
   self.view.backgroundColor = [UIColor whiteColor];
   [self bgScrollView];

}
#pragma mark - 2 Create UI

#pragma mark - 3 LoadData

#pragma mark - 4 Delegate Method

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	[self.view endEditing:YES];

}



#pragma mark - 5 Extract Method
//当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
	

	self.bgScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + height);
	
	self.bgScrollView.contentOffset = CGPointMake(0, height);
	
}

//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification
{

	
	self.bgScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
	
	self.bgScrollView.contentOffset = CGPointMake(0, 0);
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
