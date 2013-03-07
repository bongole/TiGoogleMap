/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiUIView.h"
#import <GoogleMaps/GoogleMaps.h>
#import <MapKit/MapKit.h>

@interface ComBongoleTiGooglemapView : TiUIView {
    @private
    GMSMapView *map;
    CGFloat latitudeDelta;
    CGFloat longitudeDelta;
    CGFloat center_latitude;
    CGFloat center_longitude;
    BOOL initialized;
}

-(void)addAnnotation:(id)value;


@end
