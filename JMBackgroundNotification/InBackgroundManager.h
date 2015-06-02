//
//  InBackgroundManager.h
//  JMBackgroundNotification
//
//  Created by Joana Marisa Correia Henriques on 02/06/15.
//  Copyright (c) 2015 Joana Marisa Correia Henriques. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface InBackgroundManager : NSObject {
    BOOL inBackground;
}

@property (nonatomic,assign) BOOL inBackground;

+ (id)sharedManager;

@end
