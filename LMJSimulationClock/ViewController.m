//
//  ViewController.m
//  LMJSimulationClock
//
//  Created by LiMingjie_mac on 2017/7/21.
//  Copyright © 2017年 iOS开发者公会. All rights reserved.
//

#import "ViewController.h"

#import "LMJSimulationClock.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    LMJSimulationClock * simulationClock = [[LMJSimulationClock alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:simulationClock];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
