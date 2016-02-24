//
//  NSDate+WakeUpCategory.m
//  WakeUp
//
//  Created by Layne on 16/2/24.
//  Copyright © 2016年 lengmolehongyan. All rights reserved.
//

#import "NSDate+WakeUpCategory.h"

@implementation NSDate (WakeUpCategory)

- (NSString *)HHMMFormatString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    return [formatter stringFromDate:self];
}

@end
