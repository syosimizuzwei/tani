//
//  ViewController.h
//  tani
//
//  Created by Syotaro Shimizu on 2015/04/18.
//  Copyright (c) 2015年 Syotaro Shimizu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UITableView*table;
    
    IBOutlet UILabel *subname;
    IBOutlet UILabel *absent;
    IBOutlet UILabel *late;
    
    NSArray *subjectArray;

}

-(IBAction)plus;
-(IBAction)plust;
@property(nonatomic) NSDate* subject;
@property(nonatomic) int score;

@end
