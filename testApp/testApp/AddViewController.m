//
//  AddViewController.m
//  testApp
//
//  Created by Aaron Burke on 5/29/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "AddViewController.h"
#import "EventManager.h"

@interface AddViewController ()

@end

@implementation AddViewController

-(void)swipeLeft:(UISwipeGestureRecognizer*)recognizer
{
    
    if ([addEventText.text isEqual:@""]) { // Checks that the event name is not blank
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Invalid Event Name" message:@"Please input an event name!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        if (alertView)
        {
            [alertView show];
        }
    } else if ([datePicker.date timeIntervalSinceNow] < 0) { // Checks that the date is in the future
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Invalid Date" message:@"Please select a future date!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        if (alertView)
        {
            [alertView show];
        }
    } else {
        // On valid event name - creates the date format and passes both strings to the DidSave delegate method
        // Returns back to the main view
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"MM.d.yyyy HH:mm a zz"];
        NSString *dateString = [[NSString alloc] initWithString:[dateFormat stringFromDate:datePicker.date]];
        
        [[EventManager GetInstance] createTextAreaStr:addEventText.text date:dateString];
        
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    leftSwiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    leftSwiper.direction = UISwipeGestureRecognizerDirectionLeft;
    [leftSwipeLabel addGestureRecognizer:leftSwiper];
    
    NSDate *currentTime = [NSDate date];
    [datePicker setMinimumDate:currentTime];
    
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
