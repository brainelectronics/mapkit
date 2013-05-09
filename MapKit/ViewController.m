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

    CGRect mapPosition = CGRectMake(0, 150, self.view.frame.size.width, (self.view.frame.size.height-150));
    MKMapView *newMapView = [[MKMapView alloc] initWithFrame:mapPosition];
    self.myMapView = newMapView;
    
    
    [self.view addSubview:myMapView];
    
	[myMapView setMapType:MKMapTypeStandard];
	[myMapView setZoomEnabled:YES];
	[myMapView setScrollEnabled:YES];
    
    CLLocationCoordinate2D newCoord = {48.137222, 11.575278};

	MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    region.center = newCoord;
	//region.center.latitude = 48.137222 ;
	//region.center.longitude = 11.575278;
	region.span.longitudeDelta = 0.1f;
	region.span.latitudeDelta = 0.1f;
	[myMapView setRegion:region animated:YES];
		
	MapAnnotation *ann = [[MapAnnotation alloc] init];
	ann.title = @"On view did load";
	ann.subtitle = @"2013-04-24 13:47:23";
    ann.coordinate = newCoord;
	[myMapView addAnnotation:ann];
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

- (IBAction)goButton:(id)sender
{
    [latLabelY resignFirstResponder];
    [lonLabelX resignFirstResponder];
    
    CLLocationCoordinate2D addedCoordinate = {[latLabelY.text floatValue], [lonLabelX.text floatValue]};
    
    float marienPlatzLat = 48.137222;
    float marienPlatzLon = 11.575278;
    
	MapAnnotation *ann = [[MapAnnotation alloc] init];
	ann.title = @"Added";
	ann.subtitle = @"2013-04-24 13:47:23";
    ann.coordinate = addedCoordinate;
	[myMapView addAnnotation:ann];
    
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    
	region.center.latitude = (marienPlatzLat+[latLabelY.text floatValue])/2 ;
	region.center.longitude = (marienPlatzLon+[lonLabelX.text floatValue])/2;
    
    region.span.latitudeDelta = (fabsf(marienPlatzLon-[lonLabelX.text floatValue]))*sqrt(2);
	region.span.longitudeDelta = (fabsf(marienPlatzLat-[latLabelY.text floatValue]))*sqrt(2);
    [myMapView setRegion:region animated:YES];

    NSLog(@"lat Diff: %f",(marienPlatzLat-[latLabelY.text floatValue]));
    NSLog(@"lon Diff: %f",(marienPlatzLon-[lonLabelX.text floatValue]));
}
@end