//
//  ViewController.h
//  testApp
//
//  Created by Aaron Burke on 5/28/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UITextView *eventTextView;
    IBOutlet UIButton *saveEvents;
    
    UISwipeGestureRecognizer *rightSwiper;
}

-(IBAction)onClick:(id)sender;

@end
