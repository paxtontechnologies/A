//
//  selectTutorViewController.h
//  Accomplish
//
//  Created by John Silvester on 1/28/15.
//  Copyright (c) 2015 PaxtonTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface selectTutorViewController : UITableViewController
@property(strong,nonatomic) NSArray *information;
@property(strong,nonatomic) NSArray *Subjects;
@property(strong,nonatomic) NSMutableArray *buttonTitles;

//views
@property(strong,nonatomic) UIView *blackBackground;

//subject Picker
@property(strong,nonatomic) UIPickerView *subjectpicker;

//picker Additions
@property(nonatomic) long subjectIndex;
@property(nonatomic,strong) NSString *dateString;

//tutor stuff

@property(nonatomic,strong) NSString *tutorName;
@property(strong,nonatomic) NSArray *listoftutors;



-(void)settutorname;

@end
