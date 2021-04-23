//
//  DependentComponentPickViewController.m
//  exp5-pickers
//
//  Created by 涂成玉 on 2021/4/22.
//  Copyright © 2021年 涂成玉. All rights reserved.
//

#import "DependentComponentPickViewController.h"

#define kProvinceName 0
#define kCityName 1

@interface DependentComponentPickViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *dependPickView;
@property (strong, nonatomic) NSDictionary *dicPickerValues;
@property(strong, nonatomic) NSArray* arrKeys;
@property(strong,nonatomic)NSArray* arrValues;

@end

@implementation DependentComponentPickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSBundle* bundle = [NSBundle mainBundle];
    NSURL* url = [bundle URLForResource:@"statedictionary" withExtension:@"plist"];
    
    self.dicPickerValues = [NSDictionary dictionaryWithContentsOfURL:url];
    self.arrKeys = [self.dicPickerValues allKeys];
    self.arrValues = self.dicPickerValues[ self.arrKeys[0] ];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == kProvinceName) {
        return [self.arrKeys count];
    }
    else
    {
        return [self.arrValues count];
    }
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == kProvinceName) {
        return self.arrKeys[row];
    }
    else
    {
        return self.arrValues[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == kProvinceName) {
        NSString* key = self.arrKeys[row];
        self.arrValues = self.dicPickerValues[key];
        [self.dependPickView reloadComponent:kCityName];
        [self.dependPickView selectRow:0 inComponent:kCityName animated:YES];
    }
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    CGFloat pickerWidth = pickerView.bounds.size.width;
    if (component == kProvinceName) {
        return  2* pickerWidth/3;
    }
    else{
        return pickerWidth/3;
    }
    
}
@end
