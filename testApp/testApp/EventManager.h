//
//  EventManager.h
//  testApp
//
//  Created by Aaron Burke on 5/28/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventManager : NSObject
{
    NSString *textAreaString;
}

@property NSString *textAreaString;

+(EventManager*)GetInstance;

@end
