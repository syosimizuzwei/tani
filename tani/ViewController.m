//
//  ViewController.m
//  tani
//
//  Created by Syotaro Shimizu on 2015/04/18.
//  Copyright (c) 2015年 Syotaro Shimizu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController
@synthesize subject;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    label1.text=[NSString stringWithFormat:@"subject"];
       label2.text=[NSString stringWithFormat:@"0"];
   label3.text=[NSString stringWithFormat:@"0"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [subjectArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"subcell"];
    UILabel *label1 = (UILabel*)[cell viewWithTag:1];
    UILabel *label2 = (UILabel*)[cell viewWithTag:2];
    UILabel *label3 = (UILabel*)[cell viewWithTag:3];
    
    
    return cell;
    
}

-(IBAction)plus{
    absent++;
    label2.text=[NSString stringWithFormat:@"%d",absent];
}
-(IBAction)plust
{
    late++;
    label3.text=[NSString stringWithFormat:@"%d",late];
}
@end
