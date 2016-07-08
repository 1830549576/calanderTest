//
//  ViewController.m
//  calanderTest
//
//  Created by alnpet on 16/6/21.
//  Copyright © 2016年 alnpet. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+Category.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDate *nowDate = [NSDate date];
    
    
    NSInteger year = [nowDate year];
    NSInteger  month = [nowDate month];
    NSInteger today = [nowDate day];
    
    
    NSInteger dayCount = [nowDate numberOfDaysInCurrentMonth];
    NSInteger weekCount = [nowDate numberOfWeeksInCurrentMonth];
    
    NSInteger weekWhat = [nowDate firstWeekDayInMonth];
    
    NSInteger weekJI = [nowDate baseWeekly];
    
    NSDate *firstMonth = [nowDate baseFirstDayOfCurrentMonth];
    
    
    NSLog(@"===year=%ld,%ld,%ld\n===dayCount==%ld,%ld\n===weekWhat==%ld\n===weekJIJI==%ld\n=====%@",(long)year,(long)month,(long)today,dayCount,weekCount,weekWhat,weekJI,firstMonth);
    
    [self createUI];
}


- (void)createUI
{
    NSDate *nowDate = [NSDate date];
    
    
    NSInteger year = [nowDate year];
    NSInteger  month = [nowDate month];
    NSInteger today = [nowDate day];
    
    
    NSInteger dayCount = [nowDate numberOfDaysInCurrentMonth];
    NSInteger weekCount = [nowDate numberOfWeeksInCurrentMonth];
    
    NSInteger weekWhat = [nowDate firstWeekDayInMonth];
    
    NSInteger weekJI = [nowDate baseWeekly];
    
    NSDate *firstMonth = [nowDate baseFirstDayOfCurrentMonth];
    
    
    NSLog(@"===year=%ld,%ld,%ld\n===dayCount==%ld,%ld\n===weekWhat==%ld\n===weekJIJI==%ld\n=====%@",(long)year,(long)month,(long)today,dayCount,weekCount,weekWhat,weekJI,firstMonth);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
