//
//  ContatosNoMapaViewController.h
//  ContatosIP67
//
//  Created by ios6400 on 16/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ContatosNoMapaViewController : UIViewController

@property IBOutlet MKMapView *mapa;
@property CLLocationManager *manager;

@end
