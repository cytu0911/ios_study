//
//  ViewController.m
//  exp2-controlFun
//
//  Created by 涂成玉 on 2021/4/20.
//  Copyright © 2021年 涂成玉. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *doSomethingBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction) textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

-(IBAction) backgroundTap:(id)sender{
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
}

- (IBAction)sliderChanged:(UISlider *)sender {
    int progress = (int) lroundf(sender.value);
    
    self.sliderLabel.text = [NSString stringWithFormat:@"%d", progress ];
}

- (IBAction)switchChanged:(UISwitch *)sender {
    BOOL setting = sender.isOn;
    [self.leftSwitch setOn:setting animated:YES];
    [self.rightSwitch setOn:setting animated:YES];
}

- (IBAction)toggleControls:(UISegmentedControl *)sender {
    if( sender.selectedSegmentIndex == 0 )
    {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
        self.doSomethingBtn.hidden = YES;
    }
    else
    {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
        self.doSomethingBtn.hidden = NO;
    }
}
- (IBAction)btnPressed:(UIButton *)sender {
    UIAlertController* controller = [UIAlertController alertControllerWithTitle:@"Are You Sure" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* yesAction = [UIAlertAction actionWithTitle:@"Yes, I'm sure!" style:UIAlertActionStyleDestructive handler:^(UIAlertAction* action){
        NSString * msg;
        if([self.nameField.text length] >0 )
        {
            msg = [NSString stringWithFormat:@"You can breathe easy, %@", self.nameField.text ];
        }
        else
        {
            msg =@"You can breathe easy " ;
        }
        UIAlertController* controller2 = [UIAlertController alertControllerWithTitle:@"Something was done" message:msg preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Phew!" style:UIAlertActionStyleCancel handler:nil];
        [controller2 addAction:cancelAction];
        
        [self presentViewController:controller2 animated:YES completion:nil];
    }];
    
    UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"NO way!" style:UIAlertActionStyleCancel handler:nil];
    

    [controller addAction:noAction];

    [controller addAction:yesAction];


    UIPopoverPresentationController* ppc = controller.popoverPresentationController;
    if( ppc != nil )
    {
        ppc.sourceView = sender;
        ppc.sourceRect = sender.bounds;
    }
    [self presentViewController:controller animated:YES completion:nil];
}

@end
