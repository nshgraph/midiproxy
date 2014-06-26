//
//  MidiProxy.m
//  MidiProxy
//
//  Created by Nathan Holmberg on 26/06/14.
//  Copyright (c) 2014 Nathan Holmberg. All rights reserved.
//

#import "MidiProxy.h"

void MIDIReceivedCallback ( const MIDIPacketList  *pktlist, void *readProcRefCon, void *srcConnRefCon)
{
    MIDIEndpointRef* dest = (MIDIEndpointRef*)readProcRefCon;
    MIDIReceived(*dest, pktlist);
}

@interface MidiProxy(private)
-(void)createClientWithName:(NSString*)name;
@end

@implementation MidiProxy

-(void)createClientWithName:(NSString*)name
                     client:(MIDIClientRef*) client
                 endpointIn:(MIDIEndpointRef*) endpointIn
                endpointOut:(MIDIEndpointRef*) endpointOut
     andDestinationEndpoint:(MIDIEndpointRef*) destination;
{
    MIDIClientCreate((__bridge CFStringRef)(name), NULL, NULL, client);
    MIDIDestinationCreate(*client,(__bridge CFStringRef)(name),MIDIReceivedCallback,destination,endpointOut);
    MIDISourceCreate(*client,(__bridge CFStringRef)(name), endpointIn );
}

-(id) initWithEndPointName:(NSString*)endPointA andOtherEndpointName:(NSString*)endPointB
{
    self = [super init];
    if(self)
    {
        [self createClientWithName: endPointA client: &_clientA endpointIn: &_endpointAIn endpointOut: &_endpointAOut andDestinationEndpoint: &_endpointBOut ];
        [self createClientWithName: endPointB client: &_clientB endpointIn: &_endpointBIn endpointOut: &_endpointBOut andDestinationEndpoint: &_endpointAOut ];
        }
    return self;
}

-(void)dealloc
{
    MIDIClientDispose(self.clientA);
    MIDIEndpointDispose(self.endpointAIn);
    MIDIEndpointDispose(self.endpointAOut);
    
    MIDIClientDispose(self.clientB);
    MIDIEndpointDispose(self.endpointBIn);
    MIDIEndpointDispose(self.endpointBOut);
}

@end
