//
//  ViewController.m
//  MapKit
//
//  Created by Jonas Scharpf on 24.04.13.
//  Copyright (c) 2013 Jonas Scharpf. All rights reserved.
//

#import "ViewController.h"
#import "MapAnnotation.h"
/*
@interface ViewController ()

@end
*/
@implementation ViewController
@synthesize myMapView;
@synthesize latLabelY;
@synthesize lonLabelX;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //MKMapView *newMapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    //self.myMapView = newMapView;
    //[newMapView release];

    CGRect mapPosition = CGRectMake(0, 150, self.view.frame.size.width, (self.view.frame.size.height-150));
    MKMapView *newMapView = [[MKMapView alloc] initWithFrame:mapPosition];
    self.myMapView = newMapView;
    
    
    [self.view addSubview:myMapView];
    
	[myMapView setMapType:MKMapTypeStandard];
	[myMapView setZoomEnabled:YES];
	[myMapView setScrollEnabled:YES];
    
	MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
	region.center.latitude = 48.046289 ;
	region.center.longitude = 11.562685;
	region.span.longitudeDelta = 0.1f;
	region.span.latitudeDelta = 0.1f;
	[myMapView setRegion:region animated:YES];
		
    CLLocationCoordinate2D newCoord = {48.046289, 11.562685};
    /*
	MapAnnotation *ann = [[MapAnnotation alloc] init];
	ann.title = @"Phone";
	ann.subtitle = @"2013-04-24 13:47:23";
    ann.coordinate = newCoord;
	[myMapView addAnnotation:ann];
     */
    MapAnnotation *ann = [[MapAnnotation alloc] initWithCoordinates:newCoord title:@"Hello from Nowhere" subTitle:@"2013-04-24 13:47:23"];
    ann.pinColor = MKPinAnnotationColorPurple;
    [self.myMapView addAnnotation:ann];
    /*
	ann.title = @"Hello from Nowhere";
	ann.subtitle = @"2013-04-24 13:47:23";
    ann.coordinate = newCoord;
    ann.pinColor = MKPinAnnotationColorGreen;
	[self.myMapView addAnnotation:ann];
     */
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    self.myMapView = nil;
}

-(void)dealloc
{
    [myMapView release];
    [latLabelY release];
    [lonLabelX release];
    [super dealloc];
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation
{
    MKAnnotationView *result = nil;

    if ([annotation isKindOfClass:[MapAnnotation class]] == NO)
    {
        return result;
    }
    
    if ([mapView isEqual:self.myMapView] == NO)
    {
        return result;
    }
    
    MapAnnotation *senderAnnotation = (MapAnnotation*)annotation;
    
    NSString *pinReusableIdentifier = [MapAnnotation reusableIdentifierforPinColor:senderAnnotation.pinColor];
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pinReusableIdentifier];
    
    if (annotationView == nil)
    {
        annotationView = [[[MKPinAnnotationView alloc] initWithAnnotation:senderAnnotation reuseIdentifier:pinReusableIdentifier] autorelease];
        [annotationView setCanShowCallout:YES];
    }
    
    annotationView.pinColor = senderAnnotation.pinColor;
    result = annotationView;
    
    return result;
    /*
    MKPinAnnotationView *newAnnotation = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"redpin"];
    newAnnotation.pinColor = MKPinAnnotationColorGreen;
    newAnnotation.animatesDrop = YES;
    newAnnotation.canShowCallout = YES;
    return newAnnotation;
     */
}

- (IBAction)goButton:(id)sender
{
    [latLabelY resignFirstResponder];
    [lonLabelX resignFirstResponder];
    
    CLLocationCoordinate2D newCoord = {[latLabelY.text floatValue], [lonLabelX.text floatValue]};
    
	MapAnnotation *ann = [[MapAnnotation alloc] init];
	ann.title = @"Phone";
	ann.subtitle = @"2013-04-24 13:47:23";
    ann.coordinate = newCoord;
    ann.pinColor = MKPinAnnotationColorGreen;
	[myMapView addAnnotation:ann];
    
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
	region.center.latitude = (48.046289+[latLabelY.text floatValue])/2 ;
	region.center.longitude = (11.562685+[lonLabelX.text floatValue])/2;
	region.span.longitudeDelta = (fabsf(48.046289-[latLabelY.text floatValue]))*sqrt(2);
	region.span.latitudeDelta = (fabsf(11.562685-[lonLabelX.text floatValue]))*sqrt(2);
    [myMapView setRegion:region animated:YES];

    NSLog(@"long Diff: %f",(48.046289-[latLabelY.text floatValue]));
    NSLog(@"lat Diff: %f",(11.562685-[lonLabelX.text floatValue]));
}
@end