//
//  ViewController.h
//  tani
//
//  Created by Syotaro Shimizu on 2015/04/18.
//  Copyright (c) 2015年 Syotaro Shimizu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
@private
    NSMutableArray* items;
    UIBarButtonItem *addButton;
}
@property(nonatomic, retain) NSMutableArray* items;
@property(nonatomic, retain) UIBarButtonItem* addButton;

- (void)addEvent;

@end
