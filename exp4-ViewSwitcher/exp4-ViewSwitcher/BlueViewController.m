//
//  BlueViewController.m
//  exp4-ViewSwitcher
//
//  Created by 涂成玉 on 2021/4/21.
//  Copyright © 2021年 涂成玉. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)blueButtonPressed:(id)sender {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Blue View" message:@"You pressed Blue View" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"Yep I did" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
}

@end
