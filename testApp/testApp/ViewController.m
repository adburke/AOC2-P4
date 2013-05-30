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

-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button) {
        if (button.tag == 0) {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            if (defaults)
            {
                [defaults setObject:eventTextView.text forKey:@"events"];
                
                [defaults synchronize];
            }
        }
    }
}

-(void)swipeRight:(UISwipeGestureRecognizer*)recognizer
{
    AddViewController *addView = [[AddViewController alloc] initWithNibName:@"AddViewController" bundle:nil];
    if (addView) {
        [self presentViewController:addView animated:TRUE completion:nil];
    }
}

- (void)viewDidLoad
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults)
    {
        eventTextView.text = [defaults objectForKey:@"events"];
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear Fired");
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
