/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "ComBongoleTiGooglemapViewProxy.h"
#import "ComBongoleTiGooglemapView.h"
#import "TiUtils.h"

@implementation ComBongoleTiGooglemapViewProxy


-(void)addAnnotation:(id)args
{
    ENSURE_UI_THREAD_1_ARG(args);
    id o;
    ENSURE_ARG_OR_NIL_AT_INDEX(o, args, 0, TiProxy);
    
    [(ComBongoleTiGooglemapView*)[self view] addAnnotation:o];
}

@end
