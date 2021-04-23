//
//  DoubleComponentPickerViewController.m
//  exp5-pickers
//
//  Created by 涂成玉 on 2021/4/22.
//  Copyright © 2021年 涂成玉. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"

@interface DoubleComponentPickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *doublePicker;

@property(strong, nonatomic) NSArray* arrPickerValue1;
@property(strong, nonatomic) NSArray* arrPickerValue2;

@end

@implementation DoubleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.arrPickerValue1 = @[ @"张三", @"李四", @"王五" ];
    self.arrPickerValue2 = @[@"杭州", @"温州", @"丽水", @"台州", @"绍兴" ];
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
    NSInteger intSelected1 = [self.doublePicker selectedRowInComponent:0];
    NSInteger intSelected2 = [self.doublePicker selectedRowInComponent:1];
    
    NSString* strMessage = [[NSString alloc] initWithFormat:@"你选择的是 %@ 和 %@", self.arrPickerValue1[intSelected1], self.arrPickerValue2[intSelected2] ];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"选择" message:strMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action  = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark -
#pragma mark UIPickerViewerDelete
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    NSInteger retInt = 0;
    if (component == 0) {
        retInt = [self.arrPickerValue1 count];
    }
    else {
        retInt = [self.arrPickerValue2 count];
    }
    
    return retInt;
}

#pragma mark UIPickerViewDataSource
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == 0) {
        return self.arrPickerValue1[row];
    }
    else{
        return self.arrPickerValue2[row];
    }
    
}

@end
