/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "ComBongoleTiGooglemapAnnotationProxy.h"
#import "TiUtils.h"

@implementation ComBongoleTiGooglemapAnnotationProxy

-(void)dealloc{
    if( self.option != nil ){
        RELEASE_TO_NIL(self.option);
    }
    
    [super dealloc];
}

-(id)initWithOption:(NSDictionary *)args
{
    if( self = [super init]){
        GMSMarkerOptions *option = [[GMSMarkerOptions alloc] init];
        
        CGFloat latitude = [TiUtils floatValue:@"latitude" properties:args];
        CGFloat longitude = [TiUtils floatValue:@"longitude" properties:args];
        NSString *title = [TiUtils stringValue:@"title" properties:args];
        id img = [args objectForKey:@"image"];
        
        NSLog(@"img = %@", img);
        if( img != nil ){
            NSURL *u = [TiUtils toURL:img proxy:self];
            NSLog(@"url = %@",[u absoluteString]);
            UIImage *i = [TiUtils toImage:img proxy:self];
        NSLog(@"uiimg = %@", i);
            option.icon = i;
        }
        
        option.position = CLLocationCoordinate2DMake(latitude, longitude);
        option.title = title;
        
        self.option = [option retain];
    }
    
    return self;
}

@end
