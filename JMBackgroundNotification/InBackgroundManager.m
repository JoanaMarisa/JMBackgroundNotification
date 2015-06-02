//
//  InBackgroundManager.m
//  JMBackgroundNotification
//
//  Created by Joana Marisa Correia Henriques on 02/06/15.
//  Copyright (c) 2015 Joana Marisa Correia Henriques. All rights reserved.
//

#import "InBackgroundManager.h"

@implementation InBackgroundManager

@synthesize inBackground;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static InBackgroundManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        inBackground = NO;
    }
    return self;
}

- (void)dealloc {
    
}


@end
