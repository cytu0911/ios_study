//
//  SingleComponentPickerViewController.m
//  exp5-pickers
//
//  Created by 涂成玉 on 2021/4/22.
//  Copyright © 2021年 涂成玉. All rights reserved.
//

#import "SingleComponentPickerViewController.h"

@interface SingleComponentPickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *singlePicker;
@property (strong, nonatomic) NSArray* characterNames;

@end

@implementation SingleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.characterNames = @[ @"Luck", @"Leia", @"Han", @"Chewbacca", @"Artoo", @"Threepio", @"Lando" ];
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
    NSInteger row = [self.singlePicker selectedRowInComponent:0];
    NSString* selected = self.characterNames[row];
    NSString* title = [[NSString alloc] initWithFormat:@"Your select is %@", selected ];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Bingo" message:title preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"OK!" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark -
#pragma mark PickerData Source Methods
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return  1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.characterNames count];
}

#pragma mark Picker Delegate Methods
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.characterNames[row];
}

@end
