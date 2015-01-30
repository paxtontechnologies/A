//
//  selectTutorViewController.m
//  Accomplish
//
//  Created by John Silvester on 1/28/15.
//  Copyright (c) 2015 PaxtonTechnologies. All rights reserved.
//

#import "selectTutorViewController.h"

@interface selectTutorViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@end

@implementation selectTutorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.information = [[NSArray alloc]initWithObjects:@"Time",@"Subject",@"Tutor",@"Address",@"Zip Code",@"Submit Request", nil];
    self.Subjects = [[NSArray alloc]initWithObjects:@"Algebra",@"Calc",nil];
    self.tutorName = @"";

    self.buttonTitles = [[NSMutableArray alloc]initWithObjects:@"",@"",@"",@"",@"",@"", nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [[NSUserDefaults standardUserDefaults]setObject:self.buttonTitles forKey:@"tutor"];
    
    
  
}
-(void)viewDidAppear:(BOOL)animated{
    self.tutorName = [[[NSUserDefaults standardUserDefaults]objectForKey:@"tutor"] objectAtIndex:2];
    [self.tableView reloadData];
    
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
    return self.information.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
        // Configure the cell...
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 33, 142, 42)];
    label.font = [UIFont fontWithName:@"Mohave" size:28];
    label.text = [self.information objectAtIndex:indexPath.row];
    label.textColor = [UIColor grayColor];
    [cell.contentView addSubview:label];
 
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(200, 28, 100, 52)];
    [button setBackgroundColor:[UIColor grayColor]];
    button.tag = indexPath.row;
    [button addTarget: self action: @selector(buttonAction:) forControlEvents: UIControlEventTouchUpInside];
    [button setTitle:[self.buttonTitles objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor whiteColor];
    [cell.contentView addSubview:button];
    
    if (indexPath.row == 2) {
        [button setTitle:self.tutorName forState:UIControlStateNormal];
    }
    
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

#pragma  mark - button Actions
-(IBAction)buttonAction:(UIButton *)sender{
    if (sender.tag == 0) {
        [self createDatePicker:sender];
    }
    
    if (sender.tag == 1) {
        [self createPicker_Under:sender];
    }
    if (sender.tag == 2) {
        [self performSegueWithIdentifier:@"tutor" sender:self];
    }
    if (sender.tag == 3) {
        [self createaddressBox:sender];
    }
    
}
-(IBAction)selectedButton:(UIButton *)button{
    
    
    [self.buttonTitles replaceObjectAtIndex:button.tag withObject:[self.Subjects objectAtIndex:self.subjectIndex]];
    [self.tableView reloadData];
    [[NSUserDefaults standardUserDefaults]setObject:self.buttonTitles forKey:@"tutor"];
    [self.blackBackground removeFromSuperview];
    
}
-(IBAction)dateselect:(UIButton *)button{
    [self.buttonTitles replaceObjectAtIndex:button.tag withObject:self.dateString];
    [self.tableView reloadData];
    [[NSUserDefaults standardUserDefaults]setObject:self.buttonTitles forKey:@"tutor"];
    [self.blackBackground removeFromSuperview];
}
-(IBAction)Address:(UIButton *)button{
    [self.buttonTitles replaceObjectAtIndex:button.tag withObject:@"✓"];
    [self.buttonTitles replaceObjectAtIndex:button.tag+1 withObject:@"✓"];
    [self.tableView reloadData];
    [[NSUserDefaults standardUserDefaults]setObject:self.buttonTitles forKey:@"tutor"];
    [self.blackBackground removeFromSuperview];
    
}

#pragma mark - pickerView delegates
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// Total rows in our component.
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [self.Subjects count];
}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
  
   
    return [self.Subjects objectAtIndex: row];
}

// Do something with the selected row.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    self.subjectIndex = row;
    
}

#pragma mark - datePicker 

-(void)createDatePicker: (UIButton *)button{
    float y = button.frame.origin.y + 180;
    _blackBackground = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [_blackBackground setBackgroundColor:[[UIColor clearColor] colorWithAlphaComponent:0.7]];
    [self.view addSubview:_blackBackground];

    
    CGRect pickerFrame = CGRectMake(100, y, 200, 150);
    UIDatePicker *myPicker = [[UIDatePicker alloc] initWithFrame:pickerFrame];
    [myPicker addTarget:self action:@selector(pickerChanged:)               forControlEvents:UIControlEventValueChanged];
    myPicker.backgroundColor = [UIColor whiteColor];
    myPicker.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.blackBackground addSubview:myPicker];
    
    UIButton *selectButton = [[UIButton alloc]initWithFrame:CGRectMake(200, y + 200, 100, 50)];
    [selectButton setTitle:@"Select" forState:UIControlStateNormal];
    selectButton.titleLabel.font = [UIFont fontWithName:@"Mohave" size:25];
    selectButton.layer.cornerRadius = 5;
    selectButton.layer.borderWidth = 1;
    selectButton.tag = button.tag;
    selectButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    selectButton.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/1.3);
    [selectButton addTarget:self action:@selector(dateselect:) forControlEvents:UIControlEventTouchUpInside];
    [_blackBackground addSubview:selectButton];

}
-(void)pickerChanged: (UIDatePicker *)sender{
   
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"h:mm a"];
        self.dateString = [outputFormatter stringFromDate:sender.date ];
}


-(void)createPicker_Under: (UIButton *)button{
    //creates black overlay
    float y = button.frame.origin.y + 180;
    _blackBackground = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
   [_blackBackground setBackgroundColor:[[UIColor clearColor] colorWithAlphaComponent:0.7]];
    [self.view addSubview:_blackBackground];
   
    
    //creates picker
   _subjectpicker = [[UIPickerView alloc] initWithFrame:CGRectMake(100, y, 200, 150)];
    [_subjectpicker setDataSource: self];
    [_subjectpicker setDelegate: self];
    _subjectpicker.layer.cornerRadius = 5;
    _subjectpicker.backgroundColor = [UIColor whiteColor];
    _subjectpicker.showsSelectionIndicator = YES;
    [_blackBackground addSubview:_subjectpicker];
    
    //creates a select button below picker
    
    UIButton *selectButton = [[UIButton alloc]initWithFrame:CGRectMake(200, y + 200, 100, 50)];
    [selectButton setTitle:@"Select" forState:UIControlStateNormal];
    selectButton.titleLabel.font = [UIFont fontWithName:@"Mohave" size:25];
    selectButton.layer.cornerRadius = 5;
    selectButton.layer.borderWidth = 1;
    selectButton.tag = button.tag;
    selectButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    [selectButton addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
    [_blackBackground addSubview:selectButton];
}
-(void)createaddressBox: (UIButton *)button{
    float y = button.frame.origin.y + 180;
    
    _blackBackground = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [_blackBackground setBackgroundColor:[[UIColor clearColor] colorWithAlphaComponent:0.7]];
    [self.view addSubview:_blackBackground];
    
    
    UIView *whiteview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 50, 200)];
    whiteview.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/3);
    whiteview.backgroundColor = [UIColor whiteColor];
    whiteview.layer.cornerRadius = 5;
    [_blackBackground addSubview:whiteview];
    
    UITextField *streetName = [[UITextField alloc]initWithFrame:CGRectMake(5, 0, self.view.frame.size.width - 60, 50)];
    streetName.placeholder = @"Number & Street Name";
    streetName.font = [UIFont fontWithName:@"Mohave" size:28];
    [streetName isFirstResponder];
    [whiteview addSubview:streetName];
    
    UITextField *City = [[UITextField alloc]initWithFrame:CGRectMake(5, 50, self.view.frame.size.width - 60, 50)];
    City.placeholder = @"City";
    City.font = [UIFont fontWithName:@"Mohave" size:28];
    [whiteview addSubview:City];
    
    UITextField *State = [[UITextField alloc]initWithFrame:CGRectMake(5, 100, self.view.frame.size.width - 60, 50)];
    State.placeholder = @"State";
    State.font = [UIFont fontWithName:@"Mohave" size:28];
    [whiteview addSubview:State];
    
    UITextField *zipcode = [[UITextField alloc]initWithFrame:CGRectMake(5, 150, self.view.frame.size.width - 60, 50)];
    zipcode.placeholder = @"Zipcode";
    zipcode.font = [UIFont fontWithName:@"Mohave" size:28];
    [whiteview addSubview:zipcode];
    
    
    UIButton *selectButton = [[UIButton alloc]initWithFrame:CGRectMake(200, y + 200, 100, 50)];
    [selectButton setTitle:@"Select" forState:UIControlStateNormal];
    selectButton.titleLabel.font = [UIFont fontWithName:@"Mohave" size:25];
    selectButton.layer.cornerRadius = 5;
    selectButton.layer.borderWidth = 1;
    selectButton.tag = button.tag;
    selectButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    selectButton.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/15);
    [selectButton addTarget:self action:@selector(Address:) forControlEvents:UIControlEventTouchUpInside];
    [_blackBackground addSubview:selectButton];
    
    
}


@end
