//
//  ViewController.h
//  MapKit
//
//  Created by Jonas Scharpf on 24.04.13.
//  Copyright (c) 2013 Jonas Scharpf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, MKAnnotation>
{
    CLLocationManager *locationManager;
    //NSMutableArray *arryFollowData;
    //double degreesLat;
    //double degreesLong;
    
    //NSString *zwischengespeichert;
}

@property (nonatomic, retain) MKMapView *myMapView;
@property (retain, nonatomic) IBOutlet UITextField *latLabelY;
@property (retain, nonatomic) IBOutlet UITextField *lonLabelX;

- (IBAction)goButton:(id)sender;
@end
