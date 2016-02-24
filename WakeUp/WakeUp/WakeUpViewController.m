//
//  WakeUpViewController.m
//  WakeUp
//
//  Created by Layne on 16/2/21.
//  Copyright © 2016年 lengmolehongyan. All rights reserved.
//

#import "WakeUpViewController.h"
#import "NSDate+WakeUpCategory.h"

static CGFloat const WakeUpDuration = 12.0;

@interface WakeUpViewController ()
@property (nonatomic, strong) NSTimer *wkTimer;
@property (nonatomic, assign) CGFloat brightness;
@property (nonatomic, weak) IBOutlet UIView *wkView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (nonatomic, assign) BOOL isAdjustBrightness;
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
    self.isAdjustBrightness = NO;
    self.brightness = [UIScreen mainScreen].brightness;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.wkView.alpha = 0.001;
    self.wkView.backgroundColor = [UIColor whiteColor];
    [self setupWakeUpUI];
    self.wkTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(setupWakeUpUI) userInfo:nil repeats:YES];
}

- (void)setupWakeUpUI {
    NSString *now = [[NSDate date] HHMMFormatString];
    if ([self.wkTimeString isEqualToString:now]) {
        [self adjustBrightness];
    } else {
        self.wkView.alpha = 0.001;
        [UIScreen mainScreen].brightness = self.brightness;
    }
}

- (void)adjustBrightness {
    if (self.isAdjustBrightness) return;
    self.isAdjustBrightness = YES;
    [UIScreen mainScreen].brightness = 1.0;
    [UIView animateWithDuration:WakeUpDuration animations:^{
        self.wkView.alpha = 1;
    }];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [UIScreen mainScreen].brightness = self.brightness;
    [self.wkTimer invalidate];
}

- (void)dealloc {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.backBtn.hidden = !self.backBtn.hidden;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
