//
//  MapAnnotation.m
//  MapKit
//
//  Created by Jonas Scharpf on 24.04.13.
//  Copyright (c) 2013 Jonas Scharpf. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation

@synthesize coordinate,title,subtitle;


-(void)dealloc
{
	[title release];
    [subtitle release];
	[super dealloc];
}
@end
