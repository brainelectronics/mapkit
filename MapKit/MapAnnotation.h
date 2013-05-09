//
//  MapAnnotation.h
//  MapKit
//
//  Created by Jonas Scharpf on 24.04.13.
//  Copyright (c) 2013 Jonas Scharpf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#define REUSABLE_PIN_RED @"Red"
#define REUSABLE_PIN_GREEN @"Green"
#define REUSABLE_PIN_PURPLE @"Purple"

@interface MapAnnotation : NSObject <MKAnnotation,MKMapViewDelegate>
{
	CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *subtitle;
    MKPinAnnotationColor pinColor;
}
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) MKPinAnnotationColor pinColor;

+(NSString*) reusableIdentifierforPinColor:(MKPinAnnotationColor)paramColor;
-(id)initWithCoordinates:(CLLocationCoordinate2D)paramCoordinates title: (NSString*)paramTitle subTitle:(NSString*)paramSubTitle;
@end
