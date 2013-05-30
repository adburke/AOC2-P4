//
//  ViewController.m
//  testApp
//
//  Created by Aaron Burke on 5/28/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "ViewController.h"
#import "AddViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)onClick:(id)sender
{
    
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
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
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
