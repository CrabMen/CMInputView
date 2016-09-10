//
//  ViewController.m
//  CMInputView
//
//  Created by CrabMan on 16/9/9.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "ViewController.h"

#import "CM_InputView/CMInputView.h"
@interface ViewController ()
@property (nonatomic,strong) CMInputView *inputView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _inputView = [[CMInputView alloc]initWithFrame:CGRectMake(100, 100, 300, 40)];

    _inputView.font = [UIFont systemFontOfSize:18];
    _inputView.placeholder = @"CrabMan的测试文字";

    _inputView.cornerRadius = 4;
    _inputView.placeholderColor = [UIColor redColor];
    //_inputView.placeholderFont = [UIFont systemFontOfSize:22];
    // 设置文本框最大行数
    [_inputView textValueDidChanged:^(NSString *text, CGFloat textHeight) {
        CGRect frame = _inputView.frame;
        frame.size.height = textHeight;
        _inputView.frame = frame;
    }];
    
    _inputView.maxNumberOfLines = 4;
    [self.view addSubview:_inputView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
