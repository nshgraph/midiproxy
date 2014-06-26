//
//  AppDelegate.h
//  MidiProxy
//
//  Created by Nathan Holmberg on 26/06/14.
//  Copyright (c) 2014 Nathan Holmberg. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "MidiProxy.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (retain) MidiProxy* proxy;

@end
