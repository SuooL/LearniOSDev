//
//  ItemsViewController.m
//  Homepwner
//
//  Created by 胡振生 on 15/11/29.
//  Copyright © 2015年 胡振生. All rights reserved.
//

#import "ItemsViewController.h"
#import "ItemStore.h"
#import "Item.h"

@interface ItemsViewController ()
@property (nonatomic, strong) IBOutlet UIView* headerView;
@end

@implementation ItemsViewController

-(instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *items = [[ItemStore sharedStore]allItems];
    NSMutableArray *itemsOver50 = [self itemsOver50:items];
    NSMutableArray *itemsUnder50 = [self itemsUnder50:items];
    
    if (section == 0){
        return  [itemsUnder50 count];
    }
    else {
        return [itemsOver50  count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 重用 UITableViewCell 对象
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    NSArray *items = [[ItemStore sharedStore]allItems];
    
    NSMutableArray *itemsOver50 = [self itemsOver50:items];
    NSMutableArray *itemsUnder50 = [self itemsUnder50:items];
    
    
    if (indexPath.section == 0) {
        if (indexPath.row == ([itemsUnder50 count] - 1)) {
            cell.textLabel.font = [UIFont systemFontOfSize: 15];
            cell.textLabel.text = @"没有更多~";
        } else {
            cell.textLabel.font = [UIFont systemFontOfSize: 18];
            cell.textLabel.text = [itemsUnder50[indexPath.row] description];
        }
        cell.backgroundColor = [UIColor greenColor];
    } else if (indexPath.section == 1){
        if (indexPath.row == ([itemsOver50 count] - 1 )) {
            cell.textLabel.font = [UIFont systemFontOfSize: 15];
            cell.textLabel.text = @"真的没有了~";
        } else {
            cell.textLabel.font = [UIFont systemFontOfSize: 18];
            cell.textLabel.text = [itemsOver50[indexPath.row] description];
        }
        cell.backgroundColor = [UIColor yellowColor];
    }
    
    
    return cell;
}

// sets the height of rows  设置每个row的高度
-(CGFloat)tableView:(UITableView *)tableView :(NSIndexPath *)indexPath
{
    CGFloat rowHeight;
    
    NSArray *items = [[ItemStore sharedStore]allItems];
    
    NSMutableArray *itemsOver50 = [self itemsOver50:items];
    NSMutableArray *itemsUnder50 = [self itemsUnder50:items];
    
    if (indexPath.section == 0) {
        if (indexPath.row == ([itemsUnder50 count] - 1)) {
            rowHeight = 44;
        } else {
            rowHeight = 60;
        }
    } else if (indexPath.section == 1){
        if (indexPath.row == ([itemsOver50 count] - 1 )) {
            rowHeight = 44;
        } else {
            rowHeight = 60;
        }
    }
    
    return  rowHeight;
}


// sets the title for the section headers  设置每个section的header的title
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    if (section == 0) {
        return @"少于 50 ￥";
    }  else {
        return @"土豪版";
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Remove";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *items = [[ItemStore sharedStore]allItems];
        NSMutableArray *itemsOver50 = [self itemsOver50:items];
        NSMutableArray *itemsUnder50 = [self itemsUnder50:items];
        if (indexPath.section == 0  ) {
            Item * item = itemsUnder50[indexPath.row];
            [[ItemStore sharedStore]removeItem:item];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        } else if (indexPath.section == 1 ) {
            Item * item = itemsOver50[indexPath.row];
            [[ItemStore sharedStore]removeItem:item];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        }
        
    }
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if (sourceIndexPath.section != destinationIndexPath.section) {
        return;
    }
    NSArray *items = [[ItemStore sharedStore]allItems];
    NSMutableArray *itemsOver50 = [self itemsOver50:items];
    NSMutableArray *itemsUnder50 = [self itemsUnder50:items];
    Item *needMoveItem;
    NSUInteger fromIndex, toIndex;
    if (sourceIndexPath.section == 0) {
        needMoveItem = itemsUnder50[sourceIndexPath.row];
        fromIndex = [items indexOfObject:needMoveItem];
        needMoveItem = itemsUnder50[destinationIndexPath.row];
        toIndex = [items indexOfObject:needMoveItem];
        
    }else{
        needMoveItem = itemsOver50[sourceIndexPath.row];
        fromIndex = [items indexOfObject:needMoveItem];
        needMoveItem = itemsOver50[destinationIndexPath.row];
        toIndex = [items indexOfObject:needMoveItem];
    }
    [[ItemStore sharedStore]moveItemAtIndex:fromIndex toIndex:toIndex];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *item = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([item.textLabel.text isEqual:@"没有更多~"] || [item.textLabel.text isEqual:@"真的没有了~"]) {
        return NO;
    }
    
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *item = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([item.textLabel.text isEqual:@"没有更多~"] || [item.textLabel.text isEqual:@"真的没有了~"]) {
        return NO;
    }
    
    return YES;
}


// gets a mutable array of items that have a value over 50
// also adds another item to be used for  no more items
-(NSMutableArray *)itemsOver50: (NSArray *)allItems
{
    NSMutableArray *over50Items = [[NSMutableArray alloc] init];
    
    // searches store items for items over $50
    for (Item *item in allItems) {
        if (item.valuePrice >= 50){
            [over50Items addObject:item];
        }
    }
    
    // adds dummy item to mutable array
    Item *lastItem = [[Item alloc] init];
    [over50Items addObject: lastItem];
    
    return over50Items;
}


// gets a mutable array of items that have a value under 50
// also adds another item to be used for  no more items
-(NSMutableArray *)itemsUnder50: (NSArray *)allItems
{
    NSMutableArray *itemsUnder50 = [[NSMutableArray alloc] init];
    
    // searches store items for items over $50
    for (Item *item in allItems) {
        if (item.valuePrice < 50){
            [itemsUnder50 addObject:item];
        }
    }
    
    // adds dummy item to mutable array
    Item *lastItem = [[Item alloc] init];
    [itemsUnder50 addObject: lastItem];
    
    return itemsUnder50;
}

- (IBAction)addNewItem:(id)sender
{
    Item *newItem = [[ItemStore sharedStore]createItem];
    
    NSArray *items = [[ItemStore sharedStore]allItems];
    NSMutableArray *itemsOver50 = [self itemsOver50:items];
    NSMutableArray *itemsUnder50 = [self itemsUnder50:items];
    NSInteger lastRow, section;
    if(newItem.valuePrice >=50) {
        lastRow = [itemsOver50 indexOfObject:newItem];
        section = 1;
    } else{
        lastRow = [itemsUnder50 indexOfObject:newItem];
        section = 0;
    }
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:section];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

-(IBAction)ToggleEditModel:(id)sender
{
    if (self.isEditing) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    } else{
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}

-(UIView *)headerView
{
    if (!_headerView) {
        [[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    
    return _headerView;
}

@end
