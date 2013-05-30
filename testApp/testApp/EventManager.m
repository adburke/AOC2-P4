//
//  EventManager.m
//  testApp
//
//  Created by Aaron Burke on 5/28/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "EventManager.h"

@implementation EventManager

@synthesize textAreaString;

static EventManager *_instance = nil;

+(EventManager*)GetInstance
{
    // @synchronized(self) added *Not shown in video* seemed to need this to work
    @synchronized(self){
        if (_instance == nil)
        {
            // _instance = added to clear up warning *Not shown in video like this*
            _instance = [[self alloc] init];
    
        }
    
        return _instance;
    }
}

+(id)alloc
{
    _instance = [super alloc];
    return _instance;
}

-(id)init
{
    if (self = [super init])
    {
        // Initialize the singleton with NSUserDefaults data if available
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([defaults objectForKey:@"events"] != nil)
        {
            self.textAreaString = [defaults objectForKey:@"events"];
        }
        else
        {
            self.textAreaString = @"";
        }
    }
    return self;
}
// This method sets the textAreaString value of the singleton to pass between views
-(void)createTextAreaStr:(NSString *)eventName date:(NSString *)date
{
    NSString *oldString = self.textAreaString;
    if ([oldString isEqual: @""]) {
        NSString *newString = [oldString stringByAppendingFormat:@"%@\n%@", eventName, date];
        self.textAreaString = newString;
    } else {
        NSString *newString = [oldString stringByAppendingFormat:@"\n\n%@\n%@", eventName, date];
        self.textAreaString = newString;
    }
    NSLog(@"%@", self.textAreaString);
    
}

@end
