//
//  ViewController.m
//  exp6-simpleTable
//
//  Created by 涂成玉 on 2021/4/24.
//  Copyright © 2021年 cytu. All rights reserved.
//

#import "ViewController.h"
#import "NameAndColorCell.h"

static NSString* CellTableIdentifier = @"CellTableIdentifier";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(copy , nonatomic) NSArray * dwarves;
@property(copy, nonatomic) NSArray* computers;
@property(weak, nonatomic) IBOutlet UITableView* tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dwarves = @[ @"Sleepy", @"Bob", @"Jim", @"Tom", @"Carve" ];
    
    self.computers = @[
                       @{ @"Name" : @"MacBook Air" , @"Color": @"Silver" },
                       @{ @"Name" : @"MacBook Pro" , @"Color": @"Silver" },
                       @{ @"Name" : @"iMac" , @"Color": @"Silver" },
                       @{ @"Name" : @"Mac Pro" , @"Color": @"Black" }
                       ];
    
    [self.tableView registerClass:[NameAndColorCell class] forCellReuseIdentifier:CellTableIdentifier];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [self.dwarves count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleTableIdentifier];
        
    }
    
    UIImage * image = [UIImage imageNamed:@"img_left"];
    cell.imageView.image = image;
    
    UIImage * imgHight = [UIImage imageNamed:@"img_hight"];
    cell.imageView.highlightedImage = imgHight;
    
    cell.textLabel.text = self.dwarves[indexPath.row];
    
    if (indexPath.row <3) {
        cell.detailTextLabel.text = @"Mr Tu";
    }
    else
    {
        cell.detailTextLabel.text = @"Mt Cheng";
    }
    
    return  cell;
}

@end
