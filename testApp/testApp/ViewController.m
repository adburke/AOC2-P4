//
//  ViewController.m
//  testApp
//
//  Created by Aaron Burke on 5/28/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "ViewController.h"
#import "AddViewController.h"
#import "EventManager.h"

@interface ViewController ()

@end

@implementation ViewController

// Method for the Save Button
// Saves data to NSUserDefaults
-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button) {
        if (button.tag == 0) {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            if (defaults)
            {
                [defaults setObject:eventTextView.text forKey:@"events"];
                // Saves the data to the device
                [defaults synchronize];
            }
        }
    }
}
// Method that the right swipe gesture points to
// Displays AddViewController
-(void)swipeRight:(UISwipeGestureRecognizer*)recognizer
{
    AddViewController *addView = [[AddViewController alloc] initWithNibName:@"AddViewController" bundle:nil];
    if (addView) {
        [self presentViewController:addView animated:TRUE completion:nil];
    }
}

- (void)viewDidLoad
{
    // Checks for saved data in NSUserDefaults at the key "events"
    // If available display in the textView else set textView to a blank string
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 
    if ([defaults objectForKey:@"events"] != nil)
    {
        eventTextView.text = [defaults objectForKey:@"events"];
    } else {
        eventTextView.text = @"";
    }

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    // Sets the textView to the singleton EventManager property textAreaString
    eventTextView.text = [EventManager GetInstance].textAreaString;

    rightSwiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    rightSwiper.direction = UISwipeGestureRecognizerDirectionRight;
    [rightSwipeLabel addGestureRecognizer:rightSwiper];
    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
