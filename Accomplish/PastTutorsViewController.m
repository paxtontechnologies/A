//
//  PastTutorsViewController.m
//  Accomplish
//
//  Created by John Silvester on 1/30/15.
//  Copyright (c) 2015 PaxtonTechnologies. All rights reserved.
//

#import "PastTutorsViewController.h"

@interface PastTutorsViewController ()

@end

@implementation PastTutorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pasttutors = [[NSArray alloc]initWithObjects:@"image",@"image",@"image",@"image",@"image", nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.pasttutors.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
   
    self.tableView.separatorColor = [UIColor clearColor];
    UIImageView *straigtline = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 5, cell.frame.size.height)];;
    straigtline.center = CGPointMake(cell.frame.size.width/1.2, straigtline.center.y);
    straigtline.backgroundColor = [UIColor grayColor];
    
    [cell.contentView addSubview:straigtline];
    
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    image.center = CGPointMake(cell.frame.size.width/1.2, cell.frame.size.height/2);
    image.image = [UIImage imageNamed:[self.pasttutors objectAtIndex:indexPath.row]];
    image.contentMode = UIViewContentModeScaleAspectFill;
    image.layer.cornerRadius = 80/2;
    image.layer.borderWidth = 5;
    image.clipsToBounds = YES;
    image.layer.borderColor = [[UIColor grayColor] CGColor];
    [cell.contentView addSubview:image];
    // Configure the cell...
    
    
    cell.textLabel.text = @"Tutor Name";
    cell.detailTextLabel.text = @"| Calculus |";
    cell.textLabel.font = [UIFont fontWithName:@"Mohave" size:28];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Mohave" size:13];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    return 150;}


@end
