//
//  ViewController.m
//  exp7-TableCells
//
//  Created by 涂成玉 on 2021/5/25.
//  Copyright © 2021年 cytu. All rights reserved.
//

#import "ViewController.h"
#import "NameAndColorCell.h"

static NSString* CellTableIdentifier = @"CellTableIdentifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property(copy, nonatomic) NSArray* computers;
@property(weak, nonatomic) IBOutlet UITableView* tableView;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.computers = @[
                       @{ @"Name" : @"MacBook Air" , @"Color": @"Silver" },
                       @{ @"Name" : @"MacBook Pro" , @"Color": @"Silver" },
                       @{ @"Name" : @"iMac" , @"Color": @"Silver" },
                       @{ @"Name" : @"Mac Pro" , @"Color": @"Black" }
                       ];
    
    //[self.tableView registerClass:[NameAndColorCell class] forCellReuseIdentifier:CellTableIdentifier];
    UINib* nib = [UINib nibWithNibName:@"NameAndColorCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CellTableIdentifier];
    
   // self.tableView.rowHeight = UITableViewAutomaticDimension;
   // self.tableView.estimatedRowHeight = 100 ;
    self.name = @"hello name";
    
    NSLog(@"name = %@" , self.name );
}

@synthesize name = _name;

-(NSString*) name {
    
    return _name;
}

-(void) setName:(NSString *)name{
    _name = name;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  1 ;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.computers.count;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NameAndColorCell* cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    /*if (cell==nil) {
        cell = [[NameAndColorCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellTableIdentifier];
        
        
    } */
    NSDictionary * rowData = self.computers[indexPath.row];
    cell.name = rowData[@"Name"];
    cell.color = rowData[@"Color"];
    return cell;
}
@end
