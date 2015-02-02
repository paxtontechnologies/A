//
//  tutorprofileViewController.m
//  Accomplish
//
//  Created by John Silvester on 2/1/15.
//  Copyright (c) 2015 PaxtonTechnologies. All rights reserved.
//

#import "tutorprofileViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface tutorprofileViewController ()

@end

@implementation tutorprofileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
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

-(void)createUI{
    self.image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.image.image = [UIImage imageNamed:@"image"];
    self.image.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/4);
    self.image.layer.cornerRadius = 50;
    self.image.layer.masksToBounds = YES;
    self.image.layer.borderWidth = 2;
    
    [self.view addSubview:self.image];
    self.name = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    self.name.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2.5);
    self.name.text = @"Dan K ";
    self.name.textAlignment = NSTextAlignmentCenter;
    self.name.font = [UIFont fontWithName:@"Mohave" size:13];
    [self.view addSubview:self.name];
    
    self.rating = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 155, 30)];
    self.rating.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    self.rating.titleLabel.font = self.name.font = [UIFont fontWithName:@"Mohave" size:28];
    [self.rating setTitle:@"★★★★★" forState:UIControlStateNormal];
    self.rating.titleLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.rating];
    
    self.descriptionofuser = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 50, 200)];
    self.descriptionofuser.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/1.5);
    self.descriptionofuser.font = [UIFont fontWithName:@"Mohave" size:28];
    self.descriptionofuser.numberOfLines = 100;
    self.descriptionofuser.text= @"texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext";
    self.descriptionofuser.font = [UIFont fontWithName:@"Mohave" size:13];
    
    [self.view addSubview:self.descriptionofuser];
    
    
    
    
}

@end
