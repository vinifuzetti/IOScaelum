//
//  Contato.h
//  ContatosIP67
//
//  Created by ios6400 on 13/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>

@interface Contato : NSManagedObject <MKAnnotation>

@property NSString *nome;
@property NSString *telefone;
@property NSString *email;
@property NSString *endereco;
@property NSString *site;
@property UIImage *foto;
@property NSNumber *latitude;
@property NSNumber *longitude;

@end
