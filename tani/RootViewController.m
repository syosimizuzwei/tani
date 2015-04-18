//
//  ViewController.m
//  tani
//
//  Created by Syotaro Shimizu on 2015/04/18.
//  Copyright (c) 2015年 Syotaro Shimizu. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController
@synthesize items;
@synthesize addButton;

#pragma mark -
#pragma mark View lifecycle

- (void)addEvent {
    //追加するアイテムを設定
    NSString* item = @"ドラ";
    //アイテムの挿入位置を配列の最後尾に指定
    NSInteger row = [items count];
    [items insertObject:item atIndex:row];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    //テーブルの最後の行にアイテムを追加
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    //追加した行へスクロールｓ
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    
    
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //タイトルを設定
    self.title = @"セルの追加と削除";
    //編集ボタンを左側に追加
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    //データソース（可変配列）
    items = [[NSMutableArray alloc]initWithObjects:
             @"門前清自摸和", @"立直", @"平和", @"断么九", @"三色同順", @"一盃口", nil];
    //「追加ボタン」をナビゲーションに追加
    addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addEvent)];
    self.navigationItem.rightBarButtonItem = addButton;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1; //セクションは今回はひとつしか使わない
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return items.count; //配列の数
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    //セルに入れるテキストを配列から取得
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //配列から要素を削除
        [items removeObjectAtIndex:indexPath.row];
        //テーブルから行を削除
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES; //行の並べ替えを可に
}
- (NSString*)tableView:(UITableView*)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath*)indexPath {
    return @"削除"; //削除ボタンのテキストをここで変更可能。もともと「削除」なのでこの行はなくても構わない
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [items release];
    [addButton release];
    [super dealloc];
}


@end
