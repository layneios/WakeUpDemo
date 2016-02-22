//
//  WakeUpViewController.m
//  WakeUp
//
//  Created by Layne on 16/2/21.
//  Copyright © 2016年 lengmolehongyan. All rights reserved.
//

#import "WakeUpViewController.h"

static CGFloat const WakeUpDuration = 1200.0;

@interface WakeUpViewController ()
@property (nonatomic, strong) NSTimer *wkTimer;
@property (nonatomic, assign) CGFloat brightness;
@property (nonatomic, weak) IBOutlet UIView *wkView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (nonatomic, strong) NSDateFormatter *formatter;
@end

@implementation WakeUpViewController

- (IBAction)backBtnClick:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"WakeUp";
    self.view.backgroundColor = [UIColor blackColor];
    self.wkView.userInteractionEnabled = NO;
    self.brightness = [UIScreen mainScreen].brightness;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.formatter = [[NSDateFormatter alloc] init];
    self.formatter.dateFormat = @"HH:mm";
    self.wkView.alpha = 0.001;
    self.wkView.backgroundColor = [UIColor whiteColor];
    [self setupWakeUpUI];
    self.wkTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(setupWakeUpUI) userInfo:nil repeats:YES];
}

- (void)setupWakeUpUI {
    NSDate *date = [NSDate date];
    NSString *now = [self.formatter stringFromDate:date];
    if ([self.wkTimeString isEqualToString:now]) {
        [self adjustBrightness];
        [UIScreen mainScreen].brightness = 1.0;
    } else {
        self.wkView.alpha = 0.001;
        [UIScreen mainScreen].brightness = self.brightness;
    }
}

- (void)adjustBrightness {
    [UIView animateWithDuration:WakeUpDuration animations:^{
        self.wkView.alpha = 1;
    }];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [UIScreen mainScreen].brightness = self.brightness;
    [self.wkTimer invalidate];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.backBtn.hidden = NO;
    [self.view bringSubviewToFront:self.backBtn];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
