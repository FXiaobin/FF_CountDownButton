//
//  ViewController.m
//  FF_CountDownButton
//
//  Created by fanxiaobin on 2017/5/23.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "ViewController.h"

static int second = 5;

@interface ViewController ()

@property  (nonatomic,strong) NSTimer *timer;

@property  (nonatomic,strong) UIButton *downBtn;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    second = 5;
    if (_timer) {
        [_timer invalidate];
    }
}
///这里必须要关闭定时器 不然再次push进来倒计时会错乱
-(void)viewDidDisappear:(BOOL)animated{
    if (_timer) {
        [_timer invalidate];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 30)];
    self.downBtn = button;
    button.backgroundColor = [UIColor orangeColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"发送验证码" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(countDownBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
}

- (void)countDownBtnAction:(UIButton *)sender{
    
    if (_timer) {
        [_timer invalidate];
    }
    
    sender.userInteractionEnabled = NO;
    [self.downBtn setTitle:[NSString stringWithFormat:@"还剩%02d秒",second] forState:UIControlStateNormal];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerChanged:) userInfo:nil repeats:YES];
    
}

- (void)timerChanged:(NSTimer *)timer{
    
    second--;
    if (second <= 0) {
        [timer invalidate];
        self.downBtn.userInteractionEnabled = YES;
        second = 5;
        [self.downBtn setTitle:@"重新发送" forState:UIControlStateNormal];
    }else{
        [self.downBtn setTitle:[NSString stringWithFormat:@"还剩%02d秒",second] forState:UIControlStateNormal];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
