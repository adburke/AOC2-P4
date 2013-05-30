//
//  AddViewController.h
//  testApp
//
//  Created by Aaron Burke on 5/29/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController
{
    
    IBOutlet UIButton *closeKeybrd;
    IBOutlet UITextField *addEventText;
    IBOutlet UIDatePicker *datePicker;
    IBOutlet UILabel *leftSwipeLabel;

    UISwipeGestureRecognizer *leftSwiper;
}

@end
