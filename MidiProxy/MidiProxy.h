//
//  MidiProxy.h
//  MidiProxy
//
//  Created by Nathan Holmberg on 26/06/14.
//  Copyright (c) 2014 Nathan Holmberg. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <CoreMIDI/CoreMIDI.h>

@interface MidiProxy : NSObject
{
}
@property (nonatomic,assign)MIDIClientRef clientA;
@property (nonatomic,assign)MIDIEndpointRef endpointAIn;
@property (nonatomic,assign)MIDIEndpointRef endpointAOut;
@property (nonatomic,assign)MIDIClientRef clientB;
@property (nonatomic,assign)MIDIEndpointRef endpointBIn;
@property (nonatomic,assign)MIDIEndpointRef endpointBOut;

-(id) initWithEndPointName:(NSString*)endPointA andOtherEndpointName:(NSString*)endPointB;

@end
