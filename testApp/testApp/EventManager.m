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

+(void)CreateInstance
{
    if (_instance == nil)
    {
        _instance = [[self alloc] init];
    }
}

+(EventManager*)GetInstance
{
    return _instance;
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
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if (defaults != nil)
        {
            [self setTextAreaString:[defaults objectForKey:@"events"]];
        }
        [self setTextAreaString:@""];
    }
    return self;
}

-(void)setTextArea:(NSString *)eventName date:(NSString *)date
{
    
}

@end
