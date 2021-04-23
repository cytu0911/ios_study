//
//  DataPickerViewController.m
//  exp5-pickers
//
//  Created by 涂成玉 on 2021/4/22.
//  Copyright © 2021年 涂成玉. All rights reserved.
//

#import "DataPickerViewController.h"

@interface DataPickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *dataPicker;

@end

@implementation DataPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDate* date = [NSDate date];
    [self.dataPicker setDate:date animated:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)buttonPressed:(UIButton *)sender {
    NSDate* date = self.dataPicker.date;
    NSString* message = [[NSString alloc] initWithFormat:@"You select date is %@", date];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Date and Time Selected" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
}

@end
