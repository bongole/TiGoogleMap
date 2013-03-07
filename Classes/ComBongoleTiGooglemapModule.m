/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComBongoleTiGooglemapModule.h"
#import "ComBongoleTiGooglemapAnnotationProxy.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import <GoogleMaps/GoogleMaps.h>

@implementation ComBongoleTiGooglemapModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"9b5e3993-160f-4234-8570-f5776e5bb009";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.bongole.ti.googlemap";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}

-(void)setAPIKey:(id)value
{
    ENSURE_TYPE(value, NSString);
    [GMSServices provideAPIKey:value];
}

-(id)createAnnotation:(id)args
{
    id o;
    ENSURE_ARG_OR_NIL_AT_INDEX(o, args, 0, NSObject);
    return [[[ComBongoleTiGooglemapAnnotationProxy alloc] initWithOption:o] autorelease];
}

MAKE_SYSTEM_PROP(STANDARD_TYPE, kGMSTypeNormal);
MAKE_SYSTEM_PROP(SATELLITE_TYPE, kGMSTypeSatellite);
MAKE_SYSTEM_PROP(HYBRID_TYPE, kGMSTypeHybrid);

/*
MAKE_SYSTEM_PROP(ANNOTATION_RED,MKPinAnnotationColorRed);
MAKE_SYSTEM_PROP(ANNOTATION_GREEN,MKPinAnnotationColorGreen);
MAKE_SYSTEM_PROP(ANNOTATION_PURPLE,MKPinAnnotationColorPurple);

MAKE_SYSTEM_PROP(ANNOTATION_DRAG_STATE_NONE,MKAnnotationViewDragStateNone);
MAKE_SYSTEM_PROP(ANNOTATION_DRAG_STATE_START,MKAnnotationViewDragStateStarting);
MAKE_SYSTEM_PROP(ANNOTATION_DRAG_STATE_DRAG,MKAnnotationViewDragStateDragging);
MAKE_SYSTEM_PROP(ANNOTATION_DRAG_STATE_CANCEL,MKAnnotationViewDragStateCanceling);
MAKE_SYSTEM_PROP(ANNOTATION_DRAG_STATE_END,MKAnnotationViewDragStateEnding);
*/

@end
