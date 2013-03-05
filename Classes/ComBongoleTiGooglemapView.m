/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "ComBongoleTiGooglemapView.h"

@implementation ComBongoleTiGooglemapView


-(void)dealloc
{
    if( map != nil ){
        RELEASE_TO_NIL(map);;
    }
    
    [super dealloc];
}

-(GMSMapView *)map
{
    if( map == nil ){
        GMSCameraPosition *c = [GMSCameraPosition cameraWithTarget:CLLocationCoordinate2DMake(0, 0) zoom:0];
        map = [GMSMapView mapWithFrame:CGRectMake(0, 0, 100, 100) camera:c];
        [self addSubview:map];
    }
    
    return map;
}

-(void)setUserLocation_:(id)value
{
    ENSURE_SINGLE_ARG(value,NSObject);
    [self map].myLocationEnabled = [TiUtils boolValue:value];
}

-(CGFloat)calcZoomLevel:(CLLocationCoordinate2D)location1  se:(CLLocationCoordinate2D)location2
{
    MKMapPoint point1 = MKMapPointForCoordinate(location1);
    MKMapPoint point2 = MKMapPointForCoordinate(location2);
    
    MKMapPoint centrePoint = MKMapPointMake(
                                            (point1.x + point2.x) / 2,
                                            (point1.y + point2.y) / 2);
    CLLocationCoordinate2D centreLocation = MKCoordinateForMapPoint(centrePoint);
    
    GMSMapView *_mapView = [self map];
    float mapViewWidth = _mapView.frame.size.width;
    float mapViewHeight = _mapView.frame.size.height;
    double mapScaleWidth = mapViewWidth / fabs(point2.x - point1.x);
    double mapScaleHeight = mapViewHeight / fabs(point2.y - point1.y);
    double mapScale = MIN(mapScaleWidth, mapScaleHeight);
    
    double zoomLevel = 20 + log2(mapScale);
    
    return zoomLevel;
}

-(void)setRegion_:(id)args
{
    CGFloat latitudeDelta = [TiUtils floatValue:@"latitudeDelta" properties:args];
    CGFloat longitudeDelta = [TiUtils floatValue:@"longitudeDelta" properties:args];
    CGFloat center_latitude = [TiUtils floatValue:@"latitude" properties:args];
    CGFloat center_longitude = [TiUtils floatValue:@"longitude" properties:args];
    
    CGFloat nw_latitude  = center_latitude  - (latitudeDelta  / 2.0);
    CGFloat nw_longitude = center_longitude - (longitudeDelta / 2.0);
    CGFloat se_latitude  = center_latitude  + (latitudeDelta  / 2.0);
    CGFloat se_longitude = center_longitude + (longitudeDelta / 2.0);
    
    CLLocationCoordinate2D nw = CLLocationCoordinate2DMake(nw_latitude, nw_longitude);
    CLLocationCoordinate2D se = CLLocationCoordinate2DMake(se_latitude, se_longitude);
    
    CGFloat zoom = [self calcZoomLevel:nw se:se];
    NSLog(@"zoom = %.2f", zoom);
    
    GMSCameraPosition *c = [GMSCameraPosition cameraWithTarget:CLLocationCoordinate2DMake(center_latitude, center_longitude) zoom:zoom];
    
    GMSMapView *_mapView = [self map];
    _mapView.camera = c;
}


-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    [TiUtils setView:[self map] positionRect:bounds];
    [super frameSizeChanged:frame bounds:bounds];
}
@end
