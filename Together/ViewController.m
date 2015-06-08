//
//  ViewController.m
//  Together
//
//  Created by Isaac Rosenberg on 6/2/15.
//  Copyright (c) 2015 irosenb. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "ConnectionViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <INTULocationManager/INTULocationManager.h>
#import <Parse/Parse.h>
@interface ViewController ()

@end

@implementation ViewController

- (IBAction)buttonTouched:(id)sender {
    INTULocationManager *locationManager = [INTULocationManager sharedInstance];
    
    [locationManager requestLocationWithDesiredAccuracy:INTULocationAccuracyBlock timeout:10.0 block:^(CLLocation *currentLocation, INTULocationAccuracy achievedAccuracy, INTULocationStatus status) {
        PFGeoPoint *point = [PFGeoPoint geoPointWithLatitude:currentLocation.coordinate.latitude longitude:currentLocation.coordinate.longitude];

        PFObject *placeObject = [PFObject objectWithClassName:@"Location"];
        NSDate *time = [NSDate date];
        time = [time dateByAddingTimeInterval:(5 * 60)];    
        placeObject[@"expiration"] = time;
        placeObject[@"location"] = point;
        [placeObject saveInBackground];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
