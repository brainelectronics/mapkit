//
//  MapAnnotation.m
//  MapKit
//
//  Created by Jonas Scharpf on 24.04.13.
//  Copyright (c) 2013 Jonas Scharpf. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation

@synthesize coordinate,title,subtitle,pinColor;


-(void)dealloc
{
	[title release];
    [subtitle release];
	[super dealloc];
}

+(NSString*) reusableIdentifierforPinColor:(MKPinAnnotationColor)paramColor
{
    NSString *result = nil;
    
    switch (paramColor)
    {
        case MKPinAnnotationColorRed:
        {
            result = REUSABLE_PIN_RED;
            break;
        }
        case MKPinAnnotationColorGreen:
        {
            result = REUSABLE_PIN_GREEN;
            break;
        }
        case MKPinAnnotationColorPurple:
        {
            result = REUSABLE_PIN_PURPLE;
            break;
        }
    }
    return result;
}

-(id)initWithCoordinates:(CLLocationCoordinate2D)paramCoordinates title: (NSString*)paramTitle subTitle:(NSString*)paramSubTitle
{
    self = [super init];
    
    if (self != nil)
    {
        coordinate = paramCoordinates;
        title = [paramTitle copy];
        subtitle = [paramSubTitle copy];
        pinColor = MKPinAnnotationColorGreen;
    }
    return self;
}
@end
