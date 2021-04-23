//
//  ViewController.m
//  exp3-orientations
//
//  Created by 涂成玉 on 2021/4/21.
//  Copyright © 2021年 涂成玉. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSUInteger) supportedInterfaceOrientations{
    return (UIInterfaceOrientationMaskPortrait| UIInterfaceOrientationMaskLandscapeLeft);
}
@end
