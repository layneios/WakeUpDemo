//
//  SelectViewController.m
//  WakeUp
//
//  Created by Layne on 16/2/21.
//  Copyright © 2016年 lengmolehongyan. All rights reserved.
//

#import "SelectViewController.h"
#import "WakeUpViewController.h"
#import "NSDate+WakeUpCategory.h"

@interface SelectViewController () 
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, copy) NSString *selectDateString;
@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)beginBtnClick:(UIButton *)sender {
    self.selectDateString = [self.datePicker.date HHMMFormatString];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WakeUpViewController *wkVC = segue.destinationViewController;
    wkVC.wkTimeString = self.selectDateString ? self.selectDateString : @"";
}


@end
